#!/bin/bash
e_header "Install fonts"

FONTS=$DOTFILES_DIR/fonts/*

for f in $FONTS; do
  cp $f $HOME/Library/Fonts/
done

brew cask install font-fira-code

e_success "Done!"
