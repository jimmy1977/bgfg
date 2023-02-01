#!/bin/bash 
echo "Building Background Foreground Segmation Wrapper"
rm -rf build && mkdir -p build 
cd build 
cmake ..
make -j$(grep -c ^processor /proc/cpuinfo)
