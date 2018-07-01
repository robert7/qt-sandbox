#!/bin/bash
QT_DIR=${1}
BUILD_DIR=qmake-build-debug
APPDIR=appdir
QMAKE_BINARY=${QT_DIR}/bin/qmake

if [ -z ${QT_DIR} ]; then
    echo "1st argument need to be the Qr root directory. Example: $0: /d/dev/Qt/5.5/gcc_64"
    echo "Note: Qt root is where './bin/qmake' is.."
    exit 1
fi
if [ ! -f "${QMAKE_BINARY}" ]; then
    echo "qmake binary (${QMAKE_BINARY}) not found!"
    exit 1
fi

if [ -d "${BUILD_DIR}" ]; then
  rm -rf ${BUILD_DIR}
fi
if [ -d "${APPDIR}" ]; then
  rm -rf ${APPDIR}
fi

mkdir ${BUILD_DIR}


${QMAKE_BINARY} CONFIG+=debug && make

${QMAKE_BINARY} CONFIG+=debug
make install
