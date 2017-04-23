#!/bin/bash

# create the symbolic links to the files in this repository

cd `dirname $0`

CURRENT_PATH=`pwd`
NVIM_INIT=~/.config/nvim/init.vim
NVIM_DIR=~/.nvim

if [ ! -e $NVIM_INIT ]
then
  ln -s $CURRENT_PATH/nvim/init.vim $NVIM_INIT
  echo "link to $NVIM_INIT created"
else
  echo "$NVIM_INIT already exists, skipping link"
fi

if [ ! -d $NVIM_DIR ]
then
  ln -s $CURRENT_PATH/nvim/dotnvim $NVIM_DIR
  echo "link to $NVIM_DIR created"
  echo "Bootstrapping Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git $NVIM_DIR/bundle/Vundle.vim
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
