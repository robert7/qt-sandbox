#!/bin/bash

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh

export DEB_BUILD_HARDENING=0
BUILD_DIR=./build

if [ "$(id -u)" != "0" ]; then
   # as the contents of the .deb file should bw owned by root
   echo "This script must be run as root"
   exit 1
fi


# target path of binary in appdir
BIN_PATH=/usr/bin
arch="amd64"

export VERSION=$(cat version.txt)
echo Version: ${VERSION}

if [ -d "${BUILD_DIR}" ]; then
  rm -rf ${BUILD_DIR}
fi

if [ ! -f "${APPDIR}${BIN_PATH}/${PROG}" ]; then
  echo "Binary ${APPDIR}${BIN_PATH}/${PROG} is missing. Do a build first.."
  exit 1
fi
if [ -f "${APPDIR}/*.desktop" ]; then
  echo "AppImage must NOT be build (do a build first, but don't create AppImage)"
  exit 1
fi

mkdir ${BUILD_DIR}
cp -rf ${APPDIR}/* ${BUILD_DIR}
cp -rf ${DEV_DIR}/DEBIAN ${BUILD_DIR}
cp ${DEV_DIR}/../CHANGELOG.md ${BUILD_DIR}/changelog


# edit the version & architecture
sed -i "s/__ARCH__/$arch/" ${BUILD_DIR}/DEBIAN/control || error_exit "sed"
sed -i "s/__VERSION__/$VERSION/" ${BUILD_DIR}/DEBIAN/control || error_exit "sed"

DEB_FILE=${BUILD_DIR}/${PROG}-${VERSION}_${arch}.deb

echo "\n\n--Running dpkg-deb"
dpkg-deb --build ${BUILD_DIR} ${DEB_FILE} || error_exit "dpkg-deb"

echo "\n\n--Running lintian"
lintian ${DEB_FILE} || error_exit "lintian"



