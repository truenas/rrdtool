#!/bin/bash -ex
VERSION=1.7.2
REVISION=3

wget http://deb.debian.org/debian/pool/main/r/rrdtool/rrdtool_$VERSION-$REVISION.debian.tar.xz
tar xf rrdtool_$VERSION-$REVISION.debian.tar.xz
rm rrdtool_$VERSION-$REVISION.debian.tar.xz

wget http://deb.debian.org/debian/pool/main/r/rrdtool/rrdtool_$VERSION.orig.tar.gz
tar xf rrdtool_$VERSION.orig.tar.gz --strip 1
rm rrdtool_$VERSION.orig.tar.gz

cp remove-corrupted-rrd-files.patch debian/patches
echo 'remove-corrupted-rrd-files.patch' >> debian/patches/series

echo -e "$(cat changelog)\n\n$(cat debian/changelog)" > debian/changelog
