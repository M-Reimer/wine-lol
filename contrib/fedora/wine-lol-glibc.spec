Name: wine-lol-glibc
Version: 2.33
Release: 1
License: LGPLv2.1+
Url: https://www.gnu.org/software/libc
Source0: https://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz
BuildArch: x86_64
Requires: (linux-api-headers>=4.10) tzdata filesystem
BuildRoot: /opt/wine-lol

%install
mkdir -p ${buildroot}
cp -a /binaries/glibc/ /.

%files 
/opt/wine-lol/