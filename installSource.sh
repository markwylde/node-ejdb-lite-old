rm -rf ejdb
git clone --recursive https://github.com/Softmotions/ejdb.git
cd ejdb
mkdir ./build
cd build
_CMAKE_C_COMPILER="gcc-11" _CMAKE_CXX_COMPILER="g++-11" CC=gcc-11 CXX=g++-11 cmake -DCMAKE_C_COMPILER="gcc-11" -DCMAKE_CXX_COMPILER="g++-11" .. -DBUILD_NODEJS_BINDING=ON -DCMAKE_BUILD_TYPE=Release
make
cd ../../
cp ./ejdb/build/src/bindings/ejdb2_node/ejdb2_node/linux-x64/ejdb2_node.node ./src/ejdb2_node.node
