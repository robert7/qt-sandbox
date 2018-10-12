cmake_minimum_required (VERSION 2.8.12)
project (qt-sandbox)

find_package (Qt5Widgets)
find_package (Qt5Sql)
set (QtSandbox_src src/main.cpp
        src/colormenu.cpp
    )
set (QtSandbox_hdr src/colormenu.h)

qt5_wrap_cpp(QtSandbox_hdr_moc ${QtSandbox_hdr})


include_directories (${PROJECT_SOURCE_DIR})
include_directories (${PROJECT_BINARY_DIR})

add_executable(qt-sandbox
        ${QtSandbox_src}
        ${QtSandbox_hdr_moc}
        )
target_link_libraries (qt-sandbox Qt5::Widgets Qt5::Sql)
