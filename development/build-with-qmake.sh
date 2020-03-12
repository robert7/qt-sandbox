#!/bin/bash

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh


BUILD_TYPE=${1}
APPDIR=appdir

if [ -z "${BUILD_TYPE}" ]; then
    BUILD_TYPE=debug
fi
BUILD_DIR=qmake-build-${BUILD_TYPE}
if [ ! -d "${BUILD_DIR}" ]; then
  mkdir ${BUILD_DIR}
fi

# maybe later add with "clean" parameter
#if [ -d "${BUILD_DIR}" ]; then
#  rm -rf ${BUILD_DIR}
#fi

VERSION="$(cat version.txt)-$(git rev-parse --short HEAD)"
# for simplicity now create in both dirs
echo $VERSION >${BUILD_DIR}/build-version.txt

# this may be needed, if we run from "appdir" during development
echo $VERSION >build-version.txt

QMAKE_BINARY=$(which qmake)
if [ -z "${QMAKE_BINARY}" ]; then
    echo qmake not found!
    exit 1
fi
if [ ! -f "${QMAKE_BINARY}" ]; then
    echo "qmake binary (${QMAKE_BINARY}) not found!"
    exit 1
fi



echo $QMAKE_BINARY >${BUILD_DIR}/qt-dir.txt
echo "${BUILD_DIR}">_build_dir_.txt
echo Building version: ${VERSION}

if [ -d "${APPDIR}" ]; then
  rm -rf ${APPDIR}
  rm *.AppImage 2>/dev/null
fi





PREFIX_DIR=$APPDIR/usr
#if [[ "$OSTYPE" == "darwin"* ]]; then
#  # OSX
#  PREFIX_DIR=$BUILD_DIR/$PROG.app/Contents
#fi

echo Appdir: ${APPDIR}, prefix dir: ${PREFIX_DIR}


${QMAKE_BINARY} CONFIG+=${BUILD_TYPE} PREFIX=${PREFIX_DIR} || error_exit "qmake"
make || error_exit "make"

## this is a bit hack: we rerun qmake, to generate "install" incl. just created created binary

#### TODO find out whi this is needed & FIX !!

${QMAKE_BINARY} CONFIG+=${BUILD_TYPE} PREFIX=appdir/usr || error_exit "qmake (2nd)"
make install || error_exit "make install"
