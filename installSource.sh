rm -rf ejdb
git clone --recursive https://github.com/Softmotions/ejdb.git
cd ejdb
mkdir ./build
cd build
cmake .. -DBUILD_NODEJS_BINDING=ON -DCMAKE_BUILD_TYPE=Release
make -k
cd ../../
cp ./ejdb/build/src/bindings/ejdb2_node/ejdb2_node/linux-x64/ejdb2_node.node ./src/ejdb2_node.node
