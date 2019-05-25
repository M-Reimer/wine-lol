# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>

# This PKGBUILD builds a glibc with a "hack" required to run League Of Legends
# with wine-staging (wine-lol)
# See: https://bugs.winehq.org/show_bug.cgi?id=47198#c17

pkgname=wine-lol-glibc
pkgdesc='GNU C Library patched for wine-lol'
pkgver=2.29
pkgrel=2
arch=(x86_64)
url='https://www.gnu.org/software/libc'
license=(GPL LGPL)
makedepends=(git gd lib32-gcc-libs python)
depends=('linux-api-headers>=4.10' tzdata filesystem)
optdepends=('gd: for memusagestat')
options=(!strip staticlibs)
#_commit=067fc32968b601493f4b247a3ac00caeea3f3d61
#source=(git+https://sourceware.org/git/glibc.git#commit=$_commit
source=(https://ftp.gnu.org/gnu/glibc/glibc-$pkgver.tar.xz
        bz20338.patch
        0001-Revert-elf-Correct-absolute-SHN_ABS-symbol-run-time-.patch
        file-truncated-while-reading-soname-after-patchelf.patch
        wine-lol-poc1-glibc.diff::https://bugs.winehq.org/attachment.cgi?id=64482)
md5sums=('e6c279d5b2f0736f740216f152acf974'
         'dc0d3ad59aeaaf591b085a77de6e03e9'
         'af5d3c5227ac639effe39667a43879a1'
         '0820504d2e83ee15f74a656771361872'
         '65e6d204ab9ad787c8dce999c4ba5c17')

prepare() {
  mkdir -p glibc-build lib32-glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc

  local i; for i in ${source[@]}; do
    case ${i%::*} in
      *.patch)
        msg2 "Applying ${i}"
        patch -p1 -i "$srcdir/${i}"
        ;;
    esac
  done

  # Add wine-lol glibc hack
  patch -p1 -i "$srcdir/wine-lol-poc1-glibc.diff"
}

build() {
  local _configure_flags=(
      --prefix=/opt/wine-lol
      --sysconfdir=/etc
      --datarootdir=/usr/share
      --with-headers=/usr/include
      --with-bugurl=https://bugs.archlinux.org/
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --enable-multi-arch
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --enable-static-pie
      --disable-profile
      --disable-werror
  )

  cd "$srcdir/lib32-glibc-build"
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"

  echo "slibdir=/opt/wine-lol/lib32" >> configparms
  echo "rtlddir=/opt/wine-lol/lib32" >> configparms
  echo "sbindir=/opt/wine-lol/bin" >> configparms
  echo "rootsbindir=/opt/wine-lol/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  "$srcdir/glibc/configure" \
      --host=i686-pc-linux-gnu \
      --libdir=/opt/wine-lol/lib32 \
      --libexecdir=/opt/wine-lol/lib32 \
      ${_configure_flags[@]}

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make
}

package() {
  cd lib32-glibc-build

  make install_root="$pkgdir" install

  # Dynamic linker
#  install -d "$pkgdir/opt/wine-lol/lib"
#  ln -s ../lib32/ld-linux.so.2 "$pkgdir/opt/wine-lol/lib/"

  if check_option 'debug' n; then
    find "$pkgdir"/opt/wine-lol/bin -type f -executable -exec strip $STRIP_BINARIES {} + 2> /dev/null || true
    find "$pkgdir"/opt/wine-lol/lib -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true

    find "$pkgdir"/opt/wine-lol/lib32 -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true
    find "$pkgdir"/opt/wine-lol/lib32 \
      -not -name 'ld-*.so' \
      -not -name 'libc-*.so' \
      -not -name 'libpthread-*.so' \
      -not -name 'libthread_db-*.so' \
      -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
  fi

  # These have been installed to the same location as the files in the
  # "system glibc" intentionally to make our glibc use the system files.
  rm -r "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
  rmdir "$pkgdir/usr" # should be empty now
}
