# 01
Experiments with qmake and cmake build systems.
This trivial project can be built with both of them.

## Build with qmake
Goto project directory

Build binary: `./build-with-qmake.sh /d/dev/Qt/5.5/gcc_64`

Build AppImage: `./create-AppImage.sh /d/dev/Qt/5.5/gcc_64`

Binary is created in project directory.

## Build with cmake
Goto project directory

Build binary: `./build-with-cmake.sh /d/dev/Qt/5.5/gcc_64`

Binary is currently created in cmake-build-debug directory.
