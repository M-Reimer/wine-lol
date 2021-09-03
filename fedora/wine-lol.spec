%define _build_id_links none
%define _binary_payload w7.xzdio

Name: wine-lol
Version: 5.18
Release: 1
Summary: A compatibility layer for running Windows programs - Wine Tk-Glitch with League Of Legends fixes
License: LGPLv2.1+
Url: https://github.com/M-Reimer/wine-lol/tree/master
BuildArch: x86_64
Requires: wine-lol-glibc, libfontconfig1, libfreetype6, libasound2, libglib2.0-0, libgphoto2-6, libgphoto2-port12, libgstreamer-plugins-base1.0-0, libgstreamer1.0-0, liblcms2-2, libldap-2.4-2, libmpg123-0, libopenal1, libpcap0.8, libpulse0, libudev1, libx11-6, libxext6, libxml2, (ocl-icd-libopencl1 or libopencl1), zlib1g

%description
A compatibility layer for running Windows programs - Wine Tk-Glitch with League Of Legends fixes

%install
bsdtar -vxf %{getenv:REPOPATH}/wine-lol-%{version}-%{release}-x86_64.pkg.tar.xz --include='opt/*' -C "%{buildroot}"

%files
/opt/wine-lol/
