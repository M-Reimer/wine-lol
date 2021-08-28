Name: wine-lol
Version: 5.6
Release: 1
License: LGPLv2.1+
Url: https://github.com/M-Reimer/wine-lol/tree/master
BuildArch: x86_64
Requires: wine-lol-glibc, libfontconfig1, libfreetype6, libasound2, libglib2.0-0, libgphoto2-6, libgphoto2-port12, libgstreamer-plugins-base1.0-0, libgstreamer1.0-0, liblcms2-2, libldap-2.4-2, libmpg123-0, libopenal1, libpcap0.8, libpulse0, libudev1, libx11-6, libxext6, libxml2, ocl-icd-libopencl1 | libopencl1, zlib1g
BuildRoot: /opt/wine-lol

%install
mkdir -p ${buildroot}
cp -a /binaries/wine/ /.

%files 
/opt/wine-lol/