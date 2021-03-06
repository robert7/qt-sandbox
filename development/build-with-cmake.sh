#!/bin/bash

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh

QT_DIR=${1}
BUILD_DIR=cmake-build-debug
QMAKE_BINARY=${QT_DIR}/bin/qmake

echo About to run: $0 $1

if [ -z ${QT_DIR} ]; then
    echo "Missing argument(s).."
    echo "1st argument need to be the Qr root directory."
    echo "Note: Qt root is where './bin/qmake' is.."
    echo "Example: $0 /d/dev/Qt/5.5/gcc_64"
    exit 1
fi
if [ ! -f "${QMAKE_BINARY}" ]; then
    echo "qmake binary (${QMAKE_BINARY}) not found!"
    exit 1
fi
echo qmake binary: ${QMAKE_BINARY}

if [ ! -d "${BUILD_DIR}" ]; then
  mkdir ${BUILD_DIR}
fi


cd ${BUILD_DIR}
CMAKE_PREFIX_PATH=${QT_DIR}
export CMAKE_PREFIX_PATH
cmake -DCMAKE_BUILD_TYPE=Debug -G "CodeBlocks - Unix Makefiles" .. && make



