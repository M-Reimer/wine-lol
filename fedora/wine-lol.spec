%define _build_id_links none
%define _binary_payload w7.xzdio

Name: wine-lol
Version: 5.18
Release: 1
Summary: A compatibility layer for running Windows programs - Wine Tk-Glitch with League Of Legends fixes
License: LGPLv2.1+
Url: https://github.com/M-Reimer/wine-lol/tree/master
BuildArch: x86_64
Requires: wine-lol-glibc, libxml2

%description
A compatibility layer for running Windows programs - Wine Tk-Glitch with League Of Legends fixes

%install
bsdtar -vxf %{getenv:REPOPATH}/wine-lol-%{version}-%{release}-x86_64.pkg.tar.xz --include='opt/*' -C "%{buildroot}"

%files
/opt/wine-lol/
