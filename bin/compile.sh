#!/bin/bash -le

if ! command -v git > /dev/null 2>&1; then
  echo "git is required, please install git"
  exit 1
fi

if ! command -v docker > /dev/null 2>&1; then
  echo "Docker is required, please install docker"
  exit 1
fi

rm -rf workspace/DOLSharp
git clone https://github.com/Eve-of-Darkness/DOLSharp.git workspace/DOLSharp
docker run -v $PWD/workspace/DOLSharp:/dol -i -t mono:latest nuget restore "/dol/"
docker run -v $PWD/workspace/DOLSharp:/dol -i -t mono:latest msbuild "/dol/Dawn of Light.sln"
cp -r workspace/DOLSharp/debug/languages workspace/DOLSharp/Debug
cp -r workspace/DOLSharp/debug/scripts workspace/DOLSharp/Debug
cp -r workspace/DOLSharp/debug/lib/config workspace/DOLSharp/Debug/lib
cp -r assets/config workspace/DOLSharp/Debug
