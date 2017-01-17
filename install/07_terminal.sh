#!/bin/bash

e_header "Installing fish"

if [ ! -d $DOTFILES_DIR/fish ]; then
  ln -s $DOTFILES_DIR/fish $CONFIG_DIR
fi

# Install fisherman and plugins
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher

# Fetch iterm theme
curl -Lo $DOTFILES_DIR/iterm/Oceanic-Next.itermcolors https://raw.githubusercontent.com/mhartington/oceanic-next-iterm/master/Oceanic-Next.itermcolors

e_success "Done!"
