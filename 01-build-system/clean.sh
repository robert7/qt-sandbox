#!/bin/bash
BUILD_DIR1=qmake-build-debug
BUILD_DIR2=cmake-build-debug
BUILD_DIR3=AppDir
set -e

if [ -d ${BUILD_DIR1} ]; then
  rm -rf ${BUILD_DIR1}
fi
if [ -d ${BUILD_DIR2} ]; then
  rm -rf ${BUILD_DIR2}
fi
if [ -d ${BUILD_DIR3} ]; then
  rm -rf ${BUILD_DIR3}
fi

echo OK
