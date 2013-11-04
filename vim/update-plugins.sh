#!/bin/bash

# updates all known submodules

cd `dirname $0`/..
git submodule foreach "git checkout master; git pull"
