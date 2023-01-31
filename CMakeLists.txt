cmake_minimum_required(VERSION 3.15)
project(bgfg_seg VERSION 1.0 LANGUAGES CXX)

LINK_DIRECTORIES(${PROJECT_SOURCE_DIR}/lib/)
include_directories(${PROJECT_SOURCE_DIR}/include/opencv4/)
add_executable(test bgfg_gaussmix.cpp)
target_link_libraries(test opencv_core opencv_features2d ippiw ippicv ittnotify -ldl -lz -lpthread)
#ippiw ade ittnotify libprotobuf opencv_calib3d opencv_dnn opencv_features2d opencv_flann opencv_gapi opencv_imgproc opencv_imgcodecs opencv_highgui opencv_ml opencv_objdetect opencv_photo opencv_stitching opencv_ts opencv_video opencv_videoio)