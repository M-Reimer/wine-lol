# Maintainer(s): github.com/wiryfuture

# First we're gonna build glibc and then export it so we can proceed with wine
#   # This lets us cache this process
FROM archlinux:latest as glibc-builder
# Dependencies for building packages with makepkg
RUN pacman -Sy --noconfirm --needed sudo base-devel 
# Dependencies for wine-lol-glibc
RUN pacman -Sy --noconfirm --needed git gd lib32-gcc-libs python
# make makepkg multithreaded
RUN echo 'MAKEFLAGS="-j$(expr $(nproc) \+ 1)"' >> /etc/makepkg.conf
# copy source for glibc
WORKDIR /wine-lol-glibc
ADD wine-lol-glibc/ /wine-lol-glibc/.
RUN chmod 777 -R /wine-lol-glibc
# make our export folder
RUN mkdir -p /glibc-builds && chmod 777 -R /glibc-builds

#   # Environment preparation is done, build glibc
# Build glibc
RUN sudo -u nobody bash -c 'makepkg --syncdeps'
# Copy to build folder 
RUN cp ./wine-lol-glibc-*.pkg.tar.zst /glibc-builds/.

# Second stage, building wine itself
#   # Let's us copy glibc package from glibc-builder without rebuilding it, nice.
FROM archlinux:latest as wine-builder
# Dependencies for building packages with makepkg, again
RUN pacman -Sy --noconfirm --needed sudo base-devel 
# We need to enable lib32 and multiarch for the wine dependencies
RUN echo '[multilib]' >> /etc/pacman.conf
RUN echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
# Dependencies for building wine-lol
RUN pacman -Sy --noconfirm --needed attr lib32-attr fontconfig lib32-fontconfig lcms2 lib32-lcms2 libxml2 lib32-libxml2 libxcursor lib32-libxcursor libxrandr lib32-libxrandr libxdamage lib32-libxdamage libxi lib32-libxi gettext lib32-gettext freetype2 lib32-freetype2 glu lib32-glu libsm lib32-libsm gcc-libs lib32-gcc-libs libpcap lib32-libpcap desktop-file-utils
RUN pacman -Sy --noconfirm --needed autoconf ncurses bison perl fontforge flex 'gcc>=4.5.0-2' giflib lib32-giflib libpng lib32-libpng gnutls lib32-gnutls libxinerama lib32-libxinerama libxcomposite lib32-libxcomposite libxmu lib32-libxmu libxxf86vm lib32-libxxf86vm libldap lib32-libldap mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils alsa-lib lib32-alsa-lib libxcomposite lib32-libxcomposite mesa lib32-mesa mesa-libgl lib32-mesa-libgl opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libpulse lib32-libpulse libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 gsm ffmpeg samba opencl-headers
RUN pacman -Sy --noconfirm --needed giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 gsm ffmpeg cups samba dosbox
# Copy the custom glibc package we built earlier and install
RUN mkdir -p /glibc-builds
COPY --from=glibc-builder /glibc-builds/ /glibc-builds/.
RUN pacman -U --noconfirm /glibc-builds/wine-lol-glibc-*.pkg.tar.zst
# make makepkg multithreaded (again)
RUN echo 'MAKEFLAGS="-j$(expr $(nproc) \+ 1)"' >> /etc/makepkg.conf
# Copy source for wine
WORKDIR /wine-lol
ADD wine-lol/ /wine-lol/.
RUN chmod 777 -R /wine-lol
# Make our export foldePreparation is done, build wine
RUN mkdir -p /wine-builds

#   # Environment preparation is done, build wine
# Build wine
RUN sudo -u nobody bash -c 'makepkg --syncdeps'
# Copy wine to the build folder
RUN cp ./wine-lol-*.pkg.tar.zst /wine-builds/.

# Copy all arch packages to the same folder for brevity
FROM archlinux:latest as arch-exporter
RUN mkdir -p /wine-lol && chmod 777 -R wine-lol
WORKDIR /wine-lol
# Copy wine package and glibc package to export folder
COPY --from=wine-builder /wine-builds/ /wine-lol/.
COPY --from=glibc-builder /glibc-builds/ /wine-lol/.

# Extract binaries from arch packages
FROM archlinux:latest as extract-binaries
WORKDIR /packages
RUN mkdir -p /packages/wine /packages/glibc /binaries/wine /binaries/glibc
# Copy glibc and wine packages from their builders
COPY --from=glibc-builder /glibc-builds/ /packages/glibc/.
COPY --from=wine-builder /wine-builds/ /packages/wine/.
# Extract package tarfiles
RUN cd /packages/glibc && tar -xf wine-lol-glibc-*.pkg.tar.zst
RUN cd /packages/wine && tar -xf wine-lol-*.pkg.tar.zst
# Copy binaries to their own folder
#   # Folder structure should look like this
#   # /binaries > /wine > /opt > /wine-lol > ...
#   # /binaries > /glibc > /opt > /wine-lol > ...
RUN cp -r /packages/glibc/opt /binaries/glibc/.
RUN cp -r /packages/wine/opt /binaries/wine/.

# Create tarballs from binaries
FROM archlinux:latest as tarball-packager
WORKDIR /tarballs
COPY --from=extract-binaries /binaries/. /binaries/.
# Copy binaries for glibc
RUN cp -R /binaries/glibc/opt/wine-lol /opt/wine-lol
# Create tarball for glibc
RUN tar cjfP wine-lol-glibc.tar.bz2 /opt/wine-lol
# Remove glibc binaries from directory
RUN rm -rf /opt/wine-lol
# Copy binaries for wine
RUN cp -R /binaries/wine/opt/wine-lol /opt/wine-lol
RUN tar cjfP wine-lol.tar.bz2 /opt/wine-lol

# Package binaries into .deb for debian and ubuntu folk
#   # Why don't we just use the existing debian packager/
#   #    Because Idk how to integrate it into this Dockerfile well that's why
#   # Why don't we use fpm for debian and fedora?
#   #    I have no idea on how long fpm will be maintained for so it's much more preferable to use the native option when possible
FROM ubuntu:rolling as deb-packager
WORKDIR /build_dir
RUN mkdir -p /build_dir/wine-lol-glibc/DEBIAN /build_dir/wine-lol/DEBIAN /binaries /debian-packages
# Copy binaries
COPY --from=extract-binaries /binaries /binaries
RUN cp -r /binaries/glibc/. /build_dir/wine-lol-glibc/
RUN cp -r /binaries/wine/. /build_dir/wine-lol/
# Copy contrib control files
#   # Would be nice to create these on the fly from the 'official' arch .SRCINFOs
ADD contrib/docker/debian/glibc-control  /build_dir/wine-lol-glibc/DEBIAN/control
ADD contrib/docker/debian/wine-control /build_dir/wine-lol/DEBIAN/control
# Package binaries
RUN dpkg-deb --build --root-owner-group /build_dir/wine-lol-glibc
RUN dpkg-deb --build --root-owner-group /build_dir/wine-lol
# Move binaries to export folder and we're done!
RUN cp /build_dir/*.deb /debian-packages/.

#    # Making packages 'natively' with rpmbuild isn't very intuitive.
#    # I'm going to leave this in for now because I'm planning on getting this to work instead of fpm.
#    # However, for the time being, fpm will do the building for RPMs/fedora

# Package binaries into .rpm for fedora folk
#FROM fedora:latest as rpm-packager
# Install packaging dependencies
#RUN dnf install gcc gcc-c++ make automake autoconf rpm-build -y
#WORKDIR /build_dir
#RUN mkdir -p /build_dir/wine-lol /build_dir/wine-lol-glibc
# Create dir structs
#RUN cd /build_dir/wine-lol && mkdir BUILD RPMS SOURCES SPECS SRPMS
#RUN cd /build_dir/wine-lol-glibc && mkdir BUILD RPMS SOURCES SPECS SRPMS
# Copy binaries over 
#RUN mkdir -p /binaries/wine /binaries/glibc
#COPY --from=extract-binaries /binaries/ /binaries/.
#ADD contrib/docker/fedora/wine-lol-glibc.spec /build_dir/glibc/SPECS/.
#ADD contrib/docker/fedora/wine-lol.spec /build_dir/wine/SPECS/.
# Build packages
#RUN cd /build_dir/wine-lol-glibc && rpmbuild -v -bb 
#RUN ls /build_dir/wine-lol-glibc/RPMS/

# Temporary fpm packager for RPM packages
#   # Using rpmbuild would be nice.
FROM fedora:latest as rpm-packager
# Install packaging dependencies
RUN dnf install -y ruby-devel gcc gcc-c++ make automake autoconf rpm-build squashfs-tools && gem install fpm
# Copy binaries over
WORKDIR /build_dir
RUN mkdir -p /binaries/wine /binaries/glibc
COPY --from=extract-binaries /binaries/ /binaries/.
# Create glibc dir, copy fpm file and build
RUN mkdir -p /build_dir/glibc
ADD contrib/docker/fpm/glibc.fpm /build_dir/glibc/.fpm
RUN cd /build_dir/glibc && fpm -t rpm
# Rinse and repeat for wine
RUN mkdir -p /build_dir/wine
ADD contrib/docker/fpm/wine.fpm /build_dir/wine/.fpm
RUN cd /build_dir/wine && fpm -t rpm
# Copy files to export folder
RUN mkdir -p /rpm-packages
RUN cp -r /build_dir/*/*.rpm /rpm-packages/.

# Export all packages to the exporter? Why? So the CMD line can actually export eveything that's why
FROM archlinux:latest as package-exporter
WORKDIR /exports
# Copy arch package
COPY --from=arch-exporter /wine-lol/ /exports/.
# Copy tarball
COPY --from=tarball-packager /tarballs/ /exports/.
# Copy deb package
COPY --from=deb-packager /debian-packages/ /exports/.
# Copy rpm package
COPY --from=rpm-packager /rpm-packages/ /exports/.

# Lastly, the magic command, where we export our built wine package to the mounted directory
CMD "cp" "-r" "/exports/." "/wine-exports/."
