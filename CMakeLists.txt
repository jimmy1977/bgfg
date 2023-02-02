cmake_minimum_required(VERSION 3.15)
project(bgfg_seg VERSION 1.0 LANGUAGES CXX)

# Building the python framework 
add_subdirectory(python)

find_package(pybind11 REQUIRED)
find_package(PythonInterp 3.9 REQUIRED)
find_package(Python3 REQUIRED)

LINK_DIRECTORIES(${PYTHON_LIBRARY})
LINK_DIRECTORIES(${PROJECT_SOURCE_DIR}/lib/ )
include_directories(${PROJECT_SOURCE_DIR}/include/opencv4/)
include_directories(${PYTHON_INCLUDE_DIR})

add_library(bgfg_seg MODULE bgfg_gaussmix.cpp)
target_link_libraries(bgfg_seg opencv_core ippiw ippicv ittnotify -lpython3.9 -ldl -lz -lpthread)
target_compile_options(bgfg_seg PUBLIC -fPIC -std=c++14 -O3 -Wall)
SET_TARGET_PROPERTIES(bgfg_seg PROPERTIES PREFIX "")
add_custom_command(TARGET bgfg_seg POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/build/bgfg_seg.so ${CMAKE_SOURCE_DIR}/build/bin/bgfg_seg.so)
add_custom_command(TARGET bgfg_seg POST_BUILD COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_SOURCE_DIR}/build/bgfg_seg.so)
