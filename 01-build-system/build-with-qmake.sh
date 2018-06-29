#!/bin/bash
QT_DIR=${1}
BUILD_DIR=qmake-build-debug
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

if [ ! -d "${BUILD_DIR}" ]; then
  mkdir ${BUILD_DIR}
fi
cd ${BUILD_DIR}



${QMAKE_BINARY} CONFIG+=debug .. && make

## add AppImage build
##&& linuxdeployqt nixnote2 -qmake=$QMAKE -appimage
