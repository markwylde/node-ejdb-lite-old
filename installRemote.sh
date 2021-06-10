version=$(node -p "require('./package.json').version")

(. /etc/os-release) || true
if [ `which apk` ]; then
  os=alpine
  nodedir=build/src/bindings/ejdb2_node/ejdb2_node/linux-x64
elif [ "$(uname)" = "Linux" ]; then
  os=linux
  nodedir=build/src/bindings/ejdb2_node/ejdb2_node/linux-x64
elif [[ "$OSTYPE" == "darwin"* ]]; then
  os=darwin
  nodedir=build/src/bindings/ejdb2_node/ejdb2_node/darwin-x64
else
  echo "Could not detect operating system"
  uname
  uname -a
  echo "Will attempt to build from source"
  npm install --ignore-scripts
  npm run install:source
  exit 0
fi

echo "Your OS is $os"

downloadUrl="https://github.com/markwylde/node-ejdb-lite/releases/download/v${version}/ejdb2_node_x64_${os}_14.x.node"
echo "Downloading $downloadUrl"
mkdir -p $nodedir
wget -O $nodedir/ejdb2_node.node $downloadUrl
