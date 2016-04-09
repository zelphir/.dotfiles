#!/bin/bash

e_header "Installing atom"

if [ ! -d $HOMW/.atom ]; then
  ln -s $DOTFILES_DIR/atom $HOME/.atom
fi

apm install `cat $DOTFILES_DIR/atom/packages.list`

e_success "Done!"
