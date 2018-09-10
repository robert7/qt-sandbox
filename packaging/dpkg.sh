#!/bin/bash

if [ ! -f ./development/clean.sh ]; then
  echo "You seem to be in wrong directory. script MUST be run from the project directory."
  exit 1
fi

function error_exit {
    echo "***********error_exit***********"
    echo "***********" 1>&2
    echo "*********** Failed: $1" 1>&2
    echo "***********" 1>&2
    #cd ${CDIR}
    exit 1
}

export DEB_BUILD_HARDENING=0
PROG=qt-sandbox
BUILD_DIR=./build
APPDIR=./appdir
# target path of binary
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
cp -rf ./packaging/DEBIAN ${BUILD_DIR}

# edit the version & architecture
sed -i "s/__ARCH__/$arch/" ${BUILD_DIR}/DEBIAN/control || error_exit "sed"
sed -i "s/__VERSION__/$VERSION/" ${BUILD_DIR}/DEBIAN/control || error_exit "sed"

DEB_FILE=${BUILD_DIR}/${PROG}-${VERSION}_${arch}.deb

echo "\n\n--Running dpkg-deb"
dpkg-deb --build ${BUILD_DIR} ${DEB_FILE} || error_exit "dpkg-deb"

echo "\n\n--Running lintian"
lintian ${DEB_FILE} || error_exit "lintian"



