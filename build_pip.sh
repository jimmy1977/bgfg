#!/bin/bash 

function bump_version { 
    current_version="$(python setup.py --version)"
    IFS='.' read -ra ver <<< $current_version
    new_version="${ver[0]}.${ver[1]}.$BUILD_NUMBER"
    echo $current_version
    echo $new_version
    bumpversion patch setup.py --current-version $current_version --new-version $new_version --allow-dirty 
}

echo "Building new version of the library"
cd bgfg/python 
cp ../../build/bin/bgfg_seg.so bgfg_seg/
bump_version 
python setup.py sdist bdist_wheel 
# TODO - figure out where to upload the packages 
rm -rf dist 
cd ../..