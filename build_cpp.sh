#!/bin/bash
set -euxo pipefail

source ../emsdk/emsdk_env.sh

rm -rf build
mkdir build
cd build

# export EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'
# export EMCC_DEBUG=1

cmake ..
make