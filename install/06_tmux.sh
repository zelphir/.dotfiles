#!/bin/bash

e_running "Installing tmux config..."

if [ ! -f ~/.tmux.conf ]; then
  ln -sf $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

e_success "Done!"
