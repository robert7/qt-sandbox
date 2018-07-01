cmake_minimum_required (VERSION 2.8.12)
project (myprog)

find_package (Qt5Widgets)
set (MyProject_src ${PROJECT_SOURCE_DIR}/main.cpp
                   ${PROJECT_SOURCE_DIR}/colormenu.cpp
    )
set (MyProject_hdr ${PROJECT_SOURCE_DIR}/colormenu.h)

qt5_wrap_cpp(MyProject_hdr_moc ${MyProject_hdr})


include_directories (${PROJECT_SOURCE_DIR})
include_directories (${PROJECT_BINARY_DIR})

add_executable(myprog
        ${MyProject_src}
        ${MyProject_hdr_moc}
        )
target_link_libraries (myprog Qt5::Widgets)
