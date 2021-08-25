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
# Make our export folder
RUN mkdir -p /wine-builds
# Build wine
RUN sudo -u nobody bash -c 'makepkg --syncdeps'
# Copy wine to the build folder
RUN cp ./wine-lol-*.pkg.tar.zst /wine-builds/.
# Also copy glibc package?
RUN cp /glibc-builds/wine-lol-glibc-*.pkg.tar.zst /wine-builds/.

# Third stage, copy the package to a separate folder
FROM archlinux:latest
RUN mkdir -p /wine-lol && chmod 777 -R wine-lol
WORKDIR /wine-lol
COPY --from=wine-builder /wine-builds/ /wine-lol/.
# Lastly, the magic command, where we export our built wine package to the mounted directory
CMD "cp" "-r" "/wine-lol/." "/wine-exports/."
