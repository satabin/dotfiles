# create the symbolic links to the files in this repository

cd `dirname $0`

CURRENT_PATH=`pwd`
NVIM_DIR=~/.config/nvim

if [ ! -e $NVIM_DIR ]
then
  ln -s $CURRENT_PATH/nvim $NVIM_DIR
  echo "link to $NVIM_DIR created"
else
  echo "$NVIM_DIR already exists, skipping link"
fi
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]
then
  echo "Bootstrapping vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -n "$ZSH_VERSION" ]; then
  echo "zsh detected"
  if [ ! -e ~/.local/share/pure ]
  then
    echo "installing pure prompt"
    git clone https://github.com/sindresorhus/pure.git ~/.local/share/pure
  fi
  if [ ! -e ~/.zshrc ]
  then
    ln -s $CURRENT_PATH/zsh/.zshrc ~/.zshrc
    echo "link to ~/.zshrc created"
  else
    echo "~/.zshrc already exists, skipping link"
  fi
elif [ -n "$BASH_VERSION" ]; then
  echo "bash detected"
  if [ ! -e ~/.bashrc ]
  then
    ln -s $CURRENT_PATH/bash/.bashrc ~/.bashrc
    echo "link to ~/.bashrc created"
  else
    echo "~/.bashrc already exists, skipping link"
  fi
fi

if [ ! -e ~/.config/terminator/config ]
then
  ln -s $CURRENT_PATH/terminator/config ~/.config/terminator/config
  echo "link to ~/.config/terminator/config created"
else
  echo "~/.config/terminator/config already exists, skipping link"
fi

if [ ! -e ~/.config/vifm ]
then
  ln -s $CURRENT_PATH/vifm ~/.config/vifm
  echo "link to ~/.config/vifm created"
else
  echo "~/.config/vifm already exists, skipping link"
fi

