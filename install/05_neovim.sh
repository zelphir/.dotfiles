#!/bin/bash

e_header "Installing Neovim config and plugins..."

if [ ! -d $CONFIG_DIR/nvim ]; then
  ln -sf $DOTFILES_DIR/neovim $CONFIG_DIR/nvim
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

e_success "Done!"
