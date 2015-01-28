FROM pblaszczyk/debian-etch
RUN echo "deb-src http://archive.debian.org/debian etch main" >> /etc/apt/sources.list \
    && apt-get -yq update
RUN apt-get -yq install dpkg-dev build-essential fakeroot devscripts
RUN apt-get -yq install gettext bzip2 file linux-kernel-headers gcc-4.1 autoconf gawk debhelper libc6-dev-i386 quilt po-debconf
WORKDIR /usr/local/src
RUN apt-get -yq source libc6
RUN dpkg-source -x ./glibc_2.3.6.ds1-13etch10.dsc
ADD patch.diff /usr/local/src/glibc-2.3.6.ds1/debian/patches/amd64/ghost.diff
RUN echo "amd64/ghost.diff -p1" >> /usr/local/src/glibc-2.3.6.ds1/debian/patches/series
RUN apt-get -yq build-dep glibc
RUN cd glibc* && debuild -uc -us
#RUN cd glibc* && dpkg-buildpackage -rfakeroot -uc -b
