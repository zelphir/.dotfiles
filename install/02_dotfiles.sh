#!/usr/bin/env bash

e_header "Installing dotfiles..."

DOTFILESDIR=$DOTFILES_DIR/dotfiles/*

for dotfile in $DOTFILESDIR; do
  e_running "Linking ${dotfile##*/} to $HOME/.${dotfile##*/}..."
  rm $HOME/.${dotfile##*/}
  ln -nfs "$dotfile" "$HOME/.${dotfile##*/}"
done

e_success "Done!"
