#!/bin/bash

e_header "Installing Neovim config and plugins..."
install_nvim_folder

if [ ! -d $CONFIG_DIR/nvim ]; then
  ln -sf $DOTFILES_DIR/neovim $CONFIG_DIR/nvim
  pip install neovim
  pip3 install neovim
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

e_success "Done!"
