#!/bin/bash

mkdir build
cd ./build

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS_RELEASE="-O3 -DNDEBUG" \
      -DCMAKE_C_FLAGS_RELEASE="-O3 -DNDEBUG" \
      ..

cmake --build .
sudo cmake --install .