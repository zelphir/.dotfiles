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
curl -Lo $DOTFILES_DIR/iterm/hybrid.itermcolors https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors

rm ~/Library/Preferences/com.googlecode.iterm2.plist
cp $DOTFILES_DIR/iterm/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
open $DOTFILES_DIR/iterm/Oceanic-Next.itermcolors
open $DOTFILES_DIR/iterm/hybrid.itermcolors

e_success "Done!"
