#!/usr/bin/env bash

e_header "Installing fish"

if [ ! -d $DOTFILES_DIR/fish ]; then
  ln -s $DOTFILES_DIR/fish $CONFIG_DIR
fi

# Install fisherman and plugins
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher

# Fetch iterm theme
curl -Lo $DOTFILES_DIR/iterm/gruvbox.itermcolors \
  https://raw.githubusercontent.com/morhetz/gruvbox-contrib/master/iterm2/gruvbox-dark.itermcolors

rm ~/Library/Preferences/com.googlecode.iterm2.plist
cp $DOTFILES_DIR/iterm/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

PREVDIR=$(pwd)

cd /tmp && \
  git clone https://github.com/jwilm/alacritty.git \
  cd alacritty && \
  cargo build --release
  make app && \
  cp -r target/release/osx/Alacritty.app /Applications/Shell.app

cd $PREVDIR

e_success "Done!"
