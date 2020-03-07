#!/usr/bin/bash

#   wine-lol AUR Auto-Update script
#   Copyright (C) 2020 Manuel Reimer <manuel.reimer@gmx.de>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.


# This script Auto-Distributes all changes, made here, to the relevant AUR
# repositories. This way development of the whole package set can be done in one
# single Github repository. The commit messages for AUR are auto-generated.

#
# Configuration
#

# AUR packages handled in this Git repository (full relative path).
PKGLIST=('wine-lol' 'wine-lol-glibc')

# Commit message-generator
function CommitMessage {
  echo "Sync from GitHub (https://github.com/M-Reimer/wine-lol/commit/$1)"
}

# Relative path to the cache directory
AURCACHE="aur-git-cache"



#
# Main code to handle the sync
#

# Create the AUR repository cache directory
mkdir -p "$AURCACHE" || exit 1

# Loop over the package list
for pkgbuilddir in "${PKGLIST[@]}"; do

  # Extract the pkgbase (Requires .SRCINFO to be existent and up-to-date!)
  pkgbuildmod=$(date +%s -r "$pkgbuilddir/PKGBUILD")
  srcinfomod=$(date +%s -r "$pkgbuilddir/.SRCINFO" || echo 0)
  if [ "$srcinfomod" -lt "$pkgbuildmod" ]; then
    echo ".SRCINFO is outdated for $pkgbuilddir! Recreate first!" >&2
    exit 1
  fi
  pkgbase=$(sed -n 's/^pkgbase = //p' "$pkgbuilddir/.SRCINFO")
  if [ -z "$pkgbase" ]; then
    echo "Failed to get pkgbase for $pkgbuilddir" >&2
    exit 1
  fi

  # If the AUR cache directory doesn't exist, then do a checkout
  aurgit="$AURCACHE/$pkgbase"
  if [ ! -d "$aurgit" ]; then
    git clone "ssh://aur@aur.archlinux.org/${pkgbase}.git" "$aurgit" || exit 1
  fi

  # Get timestamp of the Github GIT commit for the PKGBUILD we want to sync
  commit_time=$(git log --format=%ct -1 "$pkgbuilddir/PKGBUILD")

  # Get timestamp of latest AUR GIT commit
  aurcommit_time=$(git --git-dir="$aurgit/.git" show -s --format=%ct HEAD)
  if [ -z "$aurcommit_time" ]; then
    aurcommit_time=0
  fi

  # Compare the two timestamps.
  if [ "$aurcommit_time" -ge "$commit_time" ]; then
    continue
  fi

  # It may be possible that the AUR was updated by someone else so pull from AUR
  if git -C "$aurgit" pull; then

    # Get timestamp of latest AUR GIT commit (second time)
    aurcommit_time=$(git --git-dir="$aurgit/.git" show -s --format=%ct HEAD)
    if [ -z "$aurcommit_time" ]; then
      aurcommit_time=0
    fi

    # Compare the two timestamps (second time).
    if [ "$aurcommit_time" -ge "$commit_time" ]; then
      continue
    fi
  fi

  echo "Syncing $pkgbuilddir" >&2

  # Generate source tarball of our PKGBUILD
  pushd "$pkgbuilddir" >/dev/null || exit 1
    rm -f ./*.src.tar
    SRCEXT='.src.tar' makepkg --skipinteg --source >/dev/null
    commitid=$(git log --format="%H" -n 1 .)
  popd >/dev/null

  # Place the new files into the AUR cache
  pushd "$aurgit" >/dev/null || exit 1
    git rm ./* .SRCINFO >/dev/null 2>&1
  popd >/dev/null
  bsdtar -xf "$pkgbuilddir/"*.src.tar --strip 1 -C "$aurgit"
  rm -f "$pkgbuilddir/"*.src.tar
  pushd "$aurgit" >/dev/null || exit 1
    git add ./* .SRCINFO >/dev/null 2>&1
    if ! git diff --cached --exit-code --quiet; then
      git commit -m "$(CommitMessage $commitid)"
    fi
    git push origin master || exit 1
  popd >/dev/null
done
