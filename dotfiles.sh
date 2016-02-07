#!/bin/bash
source $HOME/.dotfiles/lib/vars.sh
source $DOTFILES_DIR/lib/utils.sh

DOTFILESDIR=$DOTFILES_DIR/dotfiles/*

for dotfile in $DOTFILESDIR; do
    e_running "Linking ${dotfile##*/} to $HOME/.${dotfile##*/}..."
    ln -nfs "$dotfile" "$HOME/.${dotfile##*/}"
done

