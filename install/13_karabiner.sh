#!/usr/bin/env bash

e_header "Installing karabiner settings..."

if [ ! -d $CONFIG_DIR/karabiner ]; then
  ln -sf $DOTFILES_DIR/karabiner $CONFIG_DIR/karabiner
fi

e_success "Done!"
