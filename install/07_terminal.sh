#!/bin/bash

e_header "Installing fish"

if [ ! -d $DOTFILES_DIR/fish/plugins/foreign-env ]; then
  git clone https://github.com/oh-my-fish/plugin-foreign-env.git $DOTFILES_DIR/fish/plugins/foreign-env
fi


if [ ! -d $DOTFILES_DIR/fish ]; then
  ln -s $DOTFILES_DIR/fish $CONFIG_DIR
fi

# Install fisherman and plugins
curl -Lo $DOTFILES_DIR/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher

# Fetch iterm theme
curl -Lo $DOTFILES_DIR/iterm/Oceanic-Next.itermcolors https://raw.githubusercontent.com/mhartington/oceanic-next-iterm/master/Oceanic-Next.itermcolors

e_success "Done!"
