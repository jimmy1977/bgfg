cmake_minimum_required(VERSION 3.15)
project(bgfg_seg VERSION 1.0 LANGUAGES CXX)

include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/include/opencv4/opencv2)
add_executable(test bgfg_gaussmix.cpp)