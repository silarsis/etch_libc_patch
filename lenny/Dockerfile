FROM pblaszczyk/debian-lenny
RUN echo "deb-src http://archive.debian.org/debian lenny main" >> /etc/apt/sources.list \
    && apt-get -yq update
RUN apt-get -yq install dpkg-dev build-essential fakeroot devscripts
RUN apt-get -yq install gettext bzip2 file linux-kernel-headers gcc-4.1 autoconf gawk debhelper libc6-dev-i386 quilt po-debconf
WORKDIR /usr/local/src
RUN apt-get -yq source libc6
RUN dpkg-source -x ./glibc_2.7-18lenny7.dsc
ADD patch.diff /usr/local/src/glibc-2.7/debian/patches/amd64/ghost.diff
RUN echo "amd64/ghost.diff -p1" >> /usr/local/src/glibc-2.7/debian/patches/series
RUN sed -i "1i glibc (2.7-18lenny7.1) stable-security; urgency=high\n\n  * Fixes: CVE-2015-0235.\n\n -- Kevin Littlejohn <kevin@littlejohn.id.au>  Wed, 28 Jan 2015 15:58:00 +0100\n" /usr/local/src/glibc-2.7/debian/changelog
RUN apt-get -yq build-dep glibc
RUN cd glibc* && debuild -uc -us
#RUN cd glibc* && dpkg-buildpackage -rfakeroot -uc -b
