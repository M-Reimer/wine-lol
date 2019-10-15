# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# Contains fixes to make League Of Legends work.
# One fix requires a "hacked" glibc (wine-lol-glibc on AUR).
# Some history:
# Primary bug report: https://bugs.winehq.org/show_bug.cgi?id=47198
# Additional crash fix: https://bugs.winehq.org/show_bug.cgi?id=45667#c5
# Fix for version 9.20: https://bugs.winehq.org/show_bug.cgi?id=47915#c2

pkgname=wine-lol
pkgver=4.17
pkgrel=2

_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/4.x/wine-$_pkgbasever.tar.xz
        "wine-staging-v$_pkgbasever.tar.gz::https://github.com/wine-staging/wine-staging/archive/v$_pkgbasever.tar.gz"
        30-win32-aliases.conf
        wine-lol-poc1-wine.diff::https://bugs.winehq.org/attachment.cgi?id=64481
        wine-lol-patch-stub.diff::https://bugs.winehq.org/attachment.cgi?id=64496
        wine-lol-bug47915.diff::https://bugs.winehq.org/attachment.cgi?id=65424)
sha512sums=('f762aab2596a4b5cf73d3282be561d25a2fe69e5d4a5ec2e29db47b3eda7496ca9eb7e57ff7765853d258422898bfa775bf9b458e61eef837b213e422bd748b8'
            '1f27511c8ff6619f4138eb3b2cd0cc1cdf42c0cd4206c68bdf792ae17c339611016e32babad121f0decf20331f7ce4400033be03c4db26cb6a4dc601c9c4b14d'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'ed9c36aee756ee8fba0b08a3ff895893df1c771077964cbe5ce1a23f66addf7212c8ca8e601cf14e5dae82af4b275d0a11c7207acd7dc4f48fdb1216d819f9dd'
            '159b075f11607114ee81ef801c77969c7b630b024a8a698b5f20a208f2cf780a2109f055d420e4292b774f3e5524a05b4c05d446d5217f1c050adb12b7409e45'
            '56213f38a9f6cd9272a86e4defabc3b88453d160f2043db909b0f7b329ff93238a6dfe0cf19213372793171a2ac909f8c09e21d91fc685deb2b65cf98ad0a234')

pkgdesc="A compatibility layer for running Windows programs - Staging branch with League Of Legends fixes"
url="http://www.wine-staging.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
  wine-lol-glibc
)

makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

install=wine.install

prepare() {
  # Allow ccache to work
  mv wine-$_pkgbasever $pkgname

  # apply wine-staging patchset
  pushd wine-staging-$_pkgbasever/patches
  # disable user32-rawinput patchset (https://bugs.winehq.org/show_bug.cgi?id=47834)
  ./patchinstall.sh DESTDIR="$srcdir/$pkgname" --all -W user32-rawinput
  popd

  # Apply League Of Legends fixes
  pushd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/wine-lol-poc1-wine.diff"
  patch -p1 -i "$srcdir/wine-lol-patch-stub.diff"
  patch -p1 -i "$srcdir/wine-lol-bug47915.diff"
  popd

  # Fix opencl header path
  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*
}

build() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  # We need RPATH to point to the "lib32" in our prefix
  _RPATH="-rpath=/opt/wine-lol/lib32"
  # Dyamic linker has to be the one in wine-lol-glibc
  _LINKER="-dynamic-linker=/opt/wine-lol/lib32/ld-linux.so.2"
  # Export all this via LDFLAGS
  export LDFLAGS="$LDFLAGS,$_RPATH,$_LINKER"

  # Make sure everything builds for 32bit
  export CFLAGS="-m32 $CFLAGS"

  msg2 "Building Wine-32..."

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"

  ../$pkgname/configure \
    --prefix=/opt/wine-lol \
    --with-x \
    --with-gstreamer \
    --with-xattr \
    --libdir=/opt/wine-lol/lib32

  make -j$(nproc) depend LDRPATH_INSTALL="-Wl,$_RPATH,$_LINKER" # Use wine-lib-glibc for -install
  make -j$(nproc)
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make -j$(nproc) prefix="$pkgdir/opt/wine-lol" \
    libdir="$pkgdir/opt/wine-lol/lib32" \
    dlldir="$pkgdir/opt/wine-lol/lib32/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-wine-lol-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
