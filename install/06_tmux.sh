#!/bin/bash

e_header "Installing tmux config..."

if [ ! -f ~/.tmux.conf ]; then
  ln -sf $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  $HOME/.tmux/plugins/tpm/bin/install_plugins
fi

e_success "Done!"
