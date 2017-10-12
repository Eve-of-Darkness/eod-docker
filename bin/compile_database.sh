#!/bin/bash -le

if ! command -v git > /dev/null 2>&1; then
  echo "git is required, please install git"
  exit 1
fi

if ! command -v docker > /dev/null 2>&1; then
  echo "Docker is required, please install docker"
  exit 1
fi

rm -rf workspace/db-public
git clone https://github.com/Eve-of-Darkness/db-public.git workspace/db-public
(cd workspace/db-public && ./src/scripts/concat.sh)
