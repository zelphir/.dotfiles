#!/bin/bash

e_running "Installing dotfiles..."

DOTFILESDIR=$DOTFILES_DIR/dotfiles/*

for dotfile in $DOTFILESDIR; do
    e_running "Linking ${dotfile##*/} to $HOME/.${dotfile##*/}..."
    ln -nfs "$dotfile" "$HOME/.${dotfile##*/}"
done

e_success "Done!"
