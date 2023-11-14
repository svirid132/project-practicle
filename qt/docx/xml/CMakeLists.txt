cmake_minimum_required(VERSION 3.14)

project(xml LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Xml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Xml)

add_executable(xml
  docxxml.h
  docxxml.cpp
  main.cpp
)
target_link_libraries(xml Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Xml)

install(TARGETS xml
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
