#!/bin/bash

DOTFILESDIR=$HOME/.dotfiles/dotfiles/*

for dotfile in $DOTFILESDIR; do
    echo "-> Linking ${dotfile##*/} to $HOME/.${dotfile##*/}..."
    ln -nfs "$dotfile" "$HOME/.${dotfile##*/}"
done

