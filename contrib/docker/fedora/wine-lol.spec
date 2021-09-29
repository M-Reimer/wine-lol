Name: wine-lol
Version: 5.18
Release: 1
License: LGPLv2.1+
Url: https://github.com/M-Reimer/wine-lol/tree/master
BuildArch: x86_64
Requires: wine-lol-glibc, libxml2
BuildRoot: /opt/wine-lol

%install
mkdir -p ${buildroot}
cp -a /binaries/wine/ /.

%files 
/opt/wine-lol/
