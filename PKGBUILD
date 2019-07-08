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

pkgname=wine-lol
pkgver=4.12.1
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/4.x/wine-$_pkgbasever.tar.xz
        "wine-staging-v$_pkgbasever.tar.gz::https://github.com/wine-staging/wine-staging/archive/v$_pkgbasever.tar.gz"
        30-win32-aliases.conf
        wine-lol-poc1-wine.diff::https://bugs.winehq.org/attachment.cgi?id=64481
        wine-lol-patch-stub.diff::https://bugs.winehq.org/attachment.cgi?id=64496)
sha512sums=('5d226aa4f24c59949c88d377d8f3d38839179e473b7e5bbf029af8142dfa23fd046ca919b63c8c8fc7e1a46077a860d3dab9d2e040f0367c85c8d386707222c1'
            '804e99567632326f5ea55fd86c4ed236da3b3636b0aaf5dbf4427694b0786326bd048fbb119b37fc66d4072dacec9ac354b804ad372cad69cbf086360eaedc38'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'ed9c36aee756ee8fba0b08a3ff895893df1c771077964cbe5ce1a23f66addf7212c8ca8e601cf14e5dae82af4b275d0a11c7207acd7dc4f48fdb1216d819f9dd'
            '159b075f11607114ee81ef801c77969c7b630b024a8a698b5f20a208f2cf780a2109f055d420e4292b774f3e5524a05b4c05d446d5217f1c050adb12b7409e45')

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
  ./patchinstall.sh DESTDIR="$srcdir/$pkgname" --all
  popd

  # Apply League Of Legends fixes
  pushd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/wine-lol-poc1-wine.diff"
  patch -p1 -i "$srcdir/wine-lol-patch-stub.diff"
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

  make depend LDRPATH_INSTALL="-Wl,$_RPATH,$_LINKER" # Use wine-lib-glibc for -install
  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-lol" \
    libdir="$pkgdir/opt/wine-lol/lib32" \
    dlldir="$pkgdir/opt/wine-lol/lib32/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-wine-lol-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
