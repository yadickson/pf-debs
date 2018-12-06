#!/bin/bash

set -ex

PKG="${PACKAGE_NAME:-${1}}"
VERSION="${PACKAGE_VERSION:-${2}}"
ADD_PATCH="${3:-false}"
ZIPFILE="${PKG}-${VERSION}.zip"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.gz"

[ ! -f "${ORIG_TARBALL}" ] || exit 0

rm -rf "${PKG}"*
rm -f "${ZIPFILE}"

wget -c "http://www.programmers-friend.org/download/pf-${VERSION}/${ZIPFILE}" || exit 1

unzip "${ZIPFILE}" -d tmp || exit 1

mv tmp/pf-src.zip "${ZIPFILE}"

rm -rf tmp

unzip "${ZIPFILE}" -d "${PKG}-${VERSION}" || exit 1

find "${PKG}-${VERSION}" -type f -name 'package.html' -exec rm -f '{}' \;

find "${PKG}-${VERSION}" -type f -name '*.java' -exec iconv -f ISO-8859-1 -t UTF-8 '{}' -o '{}'.iconv \; -exec mv '{}'.iconv '{}' \; -exec dos2unix '{}' \;

rm -rf "${PKG}-${VERSION}"/META-INF
rm -f "${PKG}-${VERSION}"/*.version

mkdir -p "${PKG}-${VERSION}"/src

mv "${PKG}-${VERSION}"/org "${PKG}-${VERSION}"/src
cp debian/libpf-java.pom.xml "${PKG}-${VERSION}/pom.xml"

if [ "${ADD_PATCH}" != "false" ]
then
   while read -r line
   do
      patch -d "${PKG}-${VERSION}" -p1 < "debian/patches/${line}"
   done < debian/patches/series
fi

tar -czf "${ORIG_TARBALL}" --exclude-vcs "${PKG}-${VERSION}" || exit 1

rm -rf "${PKG}-${VERSION}"
rm -f "${ZIPFILE}"

