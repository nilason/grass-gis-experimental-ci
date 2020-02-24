#!/usr/bin/env bash

# The make step requires something like:
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PREFIX/lib"
# further steps additionally require:
# export PATH="$PATH:$PREFIX/bin"

if [ -z "$1" ]
then
    echo "Usage: $0 PREFIX"
    exit 1
fi

export INSTALL_PREFIX=$argv[1]

# GRASS GIS

git clone https://github.com/OSGeo/grass.git

cd grass

./configure \
    --prefix="$INSTALL_PREFIX/" \
    --enable-largefile \
    --with-cxx \
    --with-zstd \
    --with-bzlib \
    --with-blas \
    --with-lapack \
    --with-readline \
    --with-openmp \
    --with-pthread \
    --with-tiff \
    --with-freetype \
    --with-freetype-includes="/usr/include/freetype2/" \
    --with-proj-share=/usr/share/proj \
    --with-geos \
    --with-sqlite \
    --with-fftw \
    --with-netcdf

make
make install
