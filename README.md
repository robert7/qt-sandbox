# qt-sandbox
Qt playground - tutorial/example/introductory experiments with Qt framework,
qmake and cmake build systems, AppImage & debian packaging.

Travis CI: [![Build Status](https://travis-ci.org/robert7/qt-sandbox.svg?branch=master)](https://travis-ci.org/robert7/qt-sandbox)

## Build with qmake
Goto project directory

Build binary (using system Qt): `./development/build-with-qmake.sh /usr release`
Build binary (using local Qt version): `./development/build-with-qmake.sh /d/dev/Qt/5.5/gcc_64 debug`

## AppImage packaging
Build AppImage: `./development/create-AppImage.sh`

Binary is created in qmake-build-debug (for debug build).

## Build with cmake
Goto project directory

Build binary: `./development/build-with-cmake.sh /usr`

Binary is currently created in cmake-build-debug directory. At this time only
"debug" build is configured.
