#!/bin/bash

e_running "Installing Neovim config and plugins..."
install_nvim_folder

if [ ! -d $CONFIG_DIR/nvim/autoload ]; then
  mkdir -p $CONFIG_DIR/nvim/autoload
fi

curl -fLo $CONFIG_DIR/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf $DOTFILES_DIR/neovim $CONFIG_DIR/nvim
pip3 install neovim

e_success "Done!"
