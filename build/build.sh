#!/bin/bash

ROOT=$(dirname "$PWD")
BUILDOUT=$ROOT/build/bin/
mkdir -p $BUILDOUT
GAMMAOUT=$ROOT/build/gamma_build
mkdir -p $GAMMAOUT

# version value
BUILD_VERSION="0.3"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOT/ps/engine/gammacb/lib/lib/

if [ ! -n "$FAISS_HOME" ]; then
  export FAISS_HOME=$ROOT/ps/engine/gammacb/lib/faiss
fi


flags="-X 'main.BuildVersion=$BUILD_VERSION' -X 'main.CommitID=$(git rev-parse HEAD)' -X 'main.BuildTime=$(date +"%Y-%m-%d %H:%M.%S")'"

echo "version info: $flags"

echo "build gamma"

cd $GAMMAOUT
# -DBUILD_PYTHON=ON
cmake -DPERFORMANCE_TESTING=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$ROOT/ps/engine/gammacb/lib $ROOT/engine/gamma/  -DPYTHON_LIBRARY=/usr/local/python3/lib/libpython3.6m.a
make gamma -j  && make install

cd ../

echo "build vearch"
go build -a -tags="vector" -ldflags "$flags" -o $BUILDOUT/vearch $ROOT/startup.go

# echo "build deploy tool"
# go build -a -ldflags "$flags" -o $BUILDOUT/batch_deployment $ROOT/tools/deployment/batch_deployment.go

