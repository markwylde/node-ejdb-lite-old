rm -rf ejdb
git clone --recursive https://github.com/Softmotions/ejdb.git
cd ejdb

printf "set (CMAKE_C_STANDARD 11)\n\n$(cat src/CMakeLists.txt)\n" > ./src/CMakeLists.txt

mkdir ./build
cd build
cmake .. -DBUILD_NODEJS_BINDING=ON -DCMAKE_BUILD_TYPE=Release
make
cd ../../
cp ./ejdb/build/src/bindings/ejdb2_node/ejdb2_node/linux-x64/ejdb2_node.node ./src/ejdb2_node.node
