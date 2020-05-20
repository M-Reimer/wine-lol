Wine-LoL
========

This repository contains build scripts to build wine-lol including the required wine-lol–glibc for Arch/Manjaro (with sync to AUR) and Debian based distributions (Ubuntu, Mint, SteamOS, ...).

**WARNING**: While in the past the Linux community received some help from Riot employees in cases where the in-game anti cheat caused the game to break on Linux with Wine, this is not guaranteed to keep this way. Especially as Riot plans to create some [kernel driver based anti cheat](https://eune.leagueoflegends.com/en-pl/news/dev/dev-null-anti-cheat-kernel-driver/) which may land in LoL at some time. So far noone knows for sure if LoL will still work with Wine as soon as this happens. So if you are playing on Linux, it is strongly recommended to not spend any money on skins or other in-game items! Your money will be lost as soon as Wine support breaks.

Binary packages are hosted on my server: https://m-reimer.de/wine-lol/

Packages for Arch are signed via GPG while the Debian packages are only delivered via encrypted HTTPS. Please read my Disclaimer! You use the packages on your own risk!

Short overview about this repository:

- **wine-lol** contains the PKGBUILD of wine-lol itself
- **wine-lol-glibc** contains the PKGBUILD for the patched glibc where wine-lol will be linked against
- **debian** contains the build script to make Debian packages from the finished Arch Linux packages (so the binaries have to be built on Arch Linux! Set up a VM if you want to build Debian packages on your own)
- **repo-make.conf** allows to autobuild the packages on a dedicated build VM
- **update-aur.sh** is used by me to distribute the files from "wine-lol" and "wine-lol-glibc" to their individual GIT repositories on AUR

Contributor notes
-----------------

Please keep in mind that the goal of this repository is **not** to keep a Wine version with the LoL patches up-to-date with the upstream Wine version but to keep **a** Wine version stable and running which allows to play LoL. It is absolutely OK if this Wine version is "old".

In the past, newer Wine versions have caused problems with LoL which required several updates to get them finally sorted out again. Updating Wine here also means that all the AUR users get Wine offered for recompile which may take up to two hours depending on the system used for building.

Or in other words: Pull requests for updating Wine are OK if you can provide at least one reason why this new Wine version improves LoL gameplay. "There is a newer version" is no valid reason for updating the Wine version here.
