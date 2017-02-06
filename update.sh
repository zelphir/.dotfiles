#!/bin/bash

# include my library helpers for colorized echo and require_brew, etc
source $HOME/.dotfiles/lib/vars.sh
source $DOTFILES_DIR/lib/utils.sh

echo
e_running "Updating...\n"

source "install/03_brew.sh"
source "install/04_brew-cask.sh"

yarn global upgrade
pip install --upgrade neovim vim-vint
pip3 install --upgrade neovim vim-vint
nvim +PlugUpdate +qall
~/.tmux/plugins/tpm/bin/update_plugins all

e_finish "Complete!\n\n"
