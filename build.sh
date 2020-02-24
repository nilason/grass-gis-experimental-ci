#!/usr/bin/env bash

# The make step requires something like:
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PREFIX/lib"
# further steps additionally require:
# export PATH="$PATH:$PREFIX/bin"

# fail on non-zero return code from a subprocess
set -e

if [ -z "$1" ]
then
    echo "Usage: $0 PREFIX"
    exit 1
fi

export INSTALL_PREFIX=$1

# GRASS GIS

git clone https://github.com/rkanavath/grass.git --branch cmake_build2 --depth=1

cd grass

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX ..

make
make install
