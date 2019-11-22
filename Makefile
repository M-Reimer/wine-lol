
PKGPATH?=
wine_VERSION=4.20-1
glibc_VERSION=2.30-1

wine_NAME=wine-lol
glibc_NAME=wine-lol-glibc

.PHONY: all
all: checkpath tempdir wine glibc

.PHONY: checkpath
checkpath:
ifeq ($(strip $(PKGPATH)),)
	@echo "Path to Arch packages not given."
	@echo "Usage:"
	@echo "make PKGPATH=[PATH_TO_ARCH_REPO]"
	@exit 1
endif
ifeq ($(wildcard $(PKGPATH)/wine-lol-$(wine_VERSION)-x86_64.pkg.tar.xz),)
	@echo "Wine package missing in $(PKGPATH)"
	@exit 1
endif
ifeq ($(wildcard $(PKGPATH)/wine-lol-glibc-$(glibc_VERSION)-x86_64.pkg.tar.xz),)
	@echo "Wine-glibc package missing in $(PKGPATH)"
	@exit 1
endif

.PHONY: tempdir
tempdir:
	rm -rf build
	mkdir -p build/wine/DEBIAN
	mkdir -p build/glibc/DEBIAN

.PHONY: wine glibc
wine glibc: ARCHPKG=$($@_NAME)-$($@_VERSION)-x86_64.pkg.tar.xz
wine glibc: DEBPATH=$($@_NAME)_$($@_VERSION)_i386.deb
wine glibc:
# Extract Arch package to build directory. Only take the opt/* part of it
	bsdtar -vxf "$(PKGPATH)/$(ARCHPKG)" --include='opt/*' -C "build/$@"

# Create the md5sums file
	pushd "build/$@"; find * -type f ! -path 'DEBIAN/*' -exec md5sum '{}' \; > "DEBIAN/md5sums"

# Create the control file
	cp "$@-control" "build/$@/DEBIAN/control"
	SIZE=$$(du build/wine --exclude '*/DEBIAN/*' -s | cut -f 1);\
	sed -i "s/\$$(SIZE)/$$SIZE/" "build/$@/DEBIAN/control"
	sed -i 's/$$(VERSION)/$($@_VERSION)/' "build/$@/DEBIAN/control"
	sed -i 's/$$(GLIBC_VERSION)/$(glibc_VERSION)/' "build/$@/DEBIAN/control"

# Create the actual debial package
	dpkg-deb --root-owner-group --build "build/$@" $(DEBPATH)
