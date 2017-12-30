#!/bin/bash
set -euxo pipefail

source $EMSDK_LOCATION/emsdk_env.sh

# rm -rf build
mkdir -p build
cd build

# export EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'
# export EMCC_DEBUG=1

# -s EXPORTED_FUNCTIONS => no main() that runs automatically
# -s NO_EXIT_RUNTIME => we *should* be able to see stdout, and postRun is called etc.
# -s WASM => wasm instead of asm.js
# -s ALLOW_MEMORY_GROWTH => allow to grow heap if necessary 
# -s TOTAL_MEMORY=20MB => alternative to above
# --bind, --std => for EMSCRIPTEN_BINDINGS syntax
export CXXFLAGS="--bind --std=c++11 -s DISABLE_EXCEPTION_CATCHING=0 -O3  -s ALLOW_MEMORY_GROWTH=1 -s WASM=1 -s NO_EXIT_RUNTIME=1 -s EXPORTED_FUNCTIONS=\"[]\""
emcmake cmake ..
emmake make

# cp zxing.js zxing.wasm ../../zxing-build/
