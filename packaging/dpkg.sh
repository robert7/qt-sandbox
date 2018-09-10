#!/bin/sh

if [ ! -f ./development/clean.sh ]; then
  echo "You seem to be in wrong directory. script MUST be run from the project directory."
  exit 1
fi

export DEB_BUILD_HARDENING=0
PROG=qt-sandbox
BUILD_DIR=./build
APPDIR=./appdir
# target path of binary
BIN_PATH=/usr/bin

if [ -d "${BUILD_DIR}" ]; then
  rm -rf ${BUILD_DIR}
fi
if [ ! -f "${APPDIR}${BIN_PATH}/${PROG}" ]; then
  echo "Binary ${APPDIR}${BIN_PATH}/${PROG} is missing. Do a build first.."
fi

mkdir ${BUILD_DIR}
cp -rf ${APPDIR} ${BUILD_DIR}

