#!/bin/bash

set -ex

PKG="${1}"
VERSION="${2}"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.xz"

[ -f "${ORIG_TARBALL}" ] || exit 1

rm -rf .pc
rm -rf pom.xml* src

tar --strip-components=1 -xJf "${ORIG_TARBALL}" "${PKG}-${VERSION}" || exit 1

