message("Out path: $${OUT_PWD}")

QT += core gui widgets sql

TARGET = qt-sandbox
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
    main.cpp \
    colormenu.cpp

HEADERS += \
        colormenu.h

CONFIG(debug, debug|release) {
    DESTDIR = qmake-build-debug
    message(Debug build!)
} else {
    DESTDIR = qmake-build-release
    message(Release build!)
}
mac {
    PREFIX = $${DESTDIR}/$${TARGET}.app
}


OBJECTS_DIR = $${DESTDIR}
MOC_DIR = $${DESTDIR}

isEmpty(PREFIX) {
    PREFIX = /usr/local
}

images.path = $${PREFIX}/share/$$TARGET/images
images.files = images/*

icons.path = $${PREFIX}/share/icons/hicolor/48x48/apps
icons.files = icons/$${TARGET}.png
RC_ICONS += "icons/$${TARGET}.png"

binary.path = $${PREFIX}/bin
binary.files = $${DESTDIR}/$${TARGET}
message("Target binary: $${binary.files}")

desktop.path = $${PREFIX}/share/applications
desktop.files = $${TARGET}.desktop

man.path = $${PREFIX}/share/man/man1
man.files = $${TARGET}.1



mac {
    message("macOS" specific build! TARGET=$${TARGET} PREFIX=$${PREFIX})
    # we go for an appbundle that contains all resources (except
    # the shared library dependencies - use macdeployqt for those).
    images.path = $${PREFIX}/Contents
    images.files = images
    INSTALLS += images
} else {
    ## message(not a "macOS" specific build!)
    INSTALLS += images icons binary desktop man
}

