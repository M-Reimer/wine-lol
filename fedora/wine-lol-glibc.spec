%define _build_id_links none
%define _binary_payload w7.xzdio

Name: wine-lol-glibc
Version: 2.33
Release: 1
Summary: GNU C Library patched for wine-lol
License: LGPLv2.1+
Url: https://www.gnu.org/software/libc
BuildArch: x86_64
Requires: (kernel-headers>=4.10) tzdata filesystem

%description
GNU C Library patched for wine-lol

%install
bsdtar -vxf %{getenv:REPOPATH}/wine-lol-glibc-%{version}-%{release}-x86_64.pkg.tar.xz --include='opt/*' -C "%{buildroot}"

%files
/opt/wine-lol/
