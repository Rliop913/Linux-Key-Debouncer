cmake_minimum_required(VERSION 3.0)

project(LinuxKeyDebouncer VERSION 1.0 LANGUAGES C CXX)

find_package(PkgConfig REQUIRED)

pkg_check_modules(LIBEVDEV REQUIRED libevdev)

include_directories(${LIBEVDEV_INCLUDE_DIRS})
link_libraries(
    ${LIBEVDEV_LIBRARIES}
  )


set(srcs
    ${CMAKE_SOURCE_DIR}/main.cpp

)

add_executable(keyDebouncer ${srcs})