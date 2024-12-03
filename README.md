# qt-sandbox
Qt playground - tutorial/example/introductory experiments with Qt framework,
qmake and cmake build systems, AppImage & debian packaging.

There is no beneficial C++ code inside just the build/packaging logic.

## Linux: build with qmake
Goto project directory
Build binary (qmake is expected on PATH): `./development/build-with-qmake.sh release`

## macOS: build with qmake
Install and configure MacPorts - e.g.: `sudo port install qt5`

Adjust PATH for MacPorts e.g.: `export PATH=/opt/local/bin:/opt/local/sbin:$PATH`

Adjust PATH for qt5 e.g.: `export PATH=/opt/local/libexec/qt5:$PATH`

Build binary (MacPorts Qt): `./development/build-with-qmake.sh release`

Run: `./qmake-build-release/qt-sandbox.app/Contents/MacOS/qt-sandbox`

## Linux: AppImage packaging
Build AppImage: `./development/create-AppImage.sh`

Binary is created in qmake-build-debug (for debug build).

## Build with cmake
Goto project directory

Build binary: `./development/build-with-cmake.sh /usr`

Binary is currently created in cmake-build-debug directory. At this time only
"debug" build is configured.


## Test sandbox changes
Random change for versioning test.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus.
Curabitur nec nunc nec nunc. Nullam nec purus. Curabitur nec nunc nec nunc.
Nullam nec purus. Curabitur nec nunc nec nunc. Nullam nec purus. Curabitur
nec nunc nec nunc. Nullam nec purus. Curabitur nec nunc nec nunc. Nullam nec

