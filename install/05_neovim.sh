#!/bin/bash

e_header "Installing Neovim config and plugins..."
install_nvim_folder

if [ ! -d $CONFIG_DIR/nvim ]; then
  ln -sf $DOTFILES_DIR/neovim $CONFIG_DIR/nvim
  pip3 install neovim
fi

if [ ! -d $CONFIG_DIR/nvim/autoload ]; then
  mkdir -p $CONFIG_DIR/nvim/autoload
fi

curl -fLo $CONFIG_DIR/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

e_success "Done!"
