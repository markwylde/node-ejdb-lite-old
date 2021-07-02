#!/bin/bash

# git clone https://github.com/Softmotions/ejdb.git

git pull softmotions master

files=("src/examples src/jbi src/jbl src/jbr src/jbs src/jql src/tests src/tmpl .lvmrc Changelog")
for file in $files
do
  rm -rf $file
  cp -r ejdb/$file $file
done

rm -rf .vscode \
  docker \
  installer \
  man \
  src/bindings/ejdb2_node/yarn.lock \
  src/bindings/ejdb2_android \
  src/bindings/ejdb2_dart \
  src/bindings/ejdb2_flutter \
  src/bindings/ejdb2_jni \
  src/bindings/ejdb2_react_native \
  src/bindings/src/bindings/ejdb2_swift \
  src/tests/yarn.lock \
  BASE.md \
  src/bindings/ejdb2_node/install.js \
  uncrustify.cfg

