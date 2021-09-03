
PKGPATH?=../repo

.PHONY: all
all:
	REPOPATH=$(realpath $(PKGPATH)) rpmbuild -bb wine-lol-glibc.spec
	REPOPATH=$(realpath $(PKGPATH)) rpmbuild -bb wine-lol.spec
	mv $(HOME)/rpmbuild/RPMS/x86_64/wine-lol-*.x86_64.rpm .
