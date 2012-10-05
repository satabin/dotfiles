#!/bin/bash

# create the symbolic links to the files in this repository

cd `dirname $0`

CURRENT_PATH=`pwd`

ln -s $CURRENT_PATH/vim ~/.vim
ln -s $CURRENT_PATH/vim/.vimrc ~/.vimrc
ln -s $CURRENT_PATH/bash/.bashrc ~/.bashrc
