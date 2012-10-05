#!/bin/bash

# adds a new vim plugin from a git repository

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` <plugin-url> <plugin-name>"
  exit 65
fi

git submodule add $1 `dirname $0`/bundle/$2
git submodule init
git submodule update
