FROM pblaszczyk/debian-etch
RUN echo "deb-src http://archive.debian.org/debian etch main" >> /etc/apt/sources.list \
    && apt-get -yq update
RUN apt-get -yq install dpkg-dev build-essential fakeroot
RUN apt-get -yq install gettext bzip2 file linux-kernel-headers gcc-4.1 autoconf gawk debhelper libc6-dev-i386 quilt po-debconf
WORKDIR /usr/local/src
RUN apt-get -yq source libc6
RUN dpkg-source -x ./glibc_2.3.6.ds1-13etch10.dsc
ADD patch.p0 /usr/local/src/patch.p0
#RUN cd glibc* && dpkg-buildpackage -rfakeroot -uc -b
