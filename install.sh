#!/bin/bash

# create the symbolic links to the files in this repository

cd `dirname $0`

CURRENT_PATH=`pwd`
NVIM_DIR=~/.config/nvim

if [ ! -e $NVIM_DIR ]
then
  ln -s $CURRENT_PATH/nvim $NVIM_DIR
  echo "link to $NVIM_DIR created"
  if [ ! -e $NVIM_DIR/bundle/Vundle.vim ]
  then
    echo "Bootstrapping Vundle..."
    mkdir -p $NVIM_DIR/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $NVIM_DIR/bundle/Vundle.vim
  fi
else
  echo "$NVIM_DIR already exists, skipping link"
fi

if [ ! -e ~/.bashrc ]
then
  ln -s $CURRENT_PATH/bash/.bashrc ~/.bashrc
  echo "link to ~/.bashrc created"
else
  echo "~/.bashrc already exists, skipping link"
fi
