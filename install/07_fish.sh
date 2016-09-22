#!/bin/bash

e_header "Installing fish"

if [ ! -d $DOTFILES_DIR/fish/plugins/foreign-env ]; then
  git clone https://github.com/oh-my-fish/plugin-foreign-env.git $DOTFILES_DIR/fish/plugins/foreign-env
fi

if [ ! -d $DOTFILES_DIR/fish ]; then
  ln -s $DOTFILES_DIR/fish $CONFIG_DIR
fi

LINE="/usr/local/bin/fish"
FILE=/etc/shells

if ! grep -q "$LINE" $FILE; then
  echo "$LINE" | sudo tee -a $FILE
fi

chsh -s `which fish` $USER
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
tic -x $DOTFILES_DIR/tmux.terminfo

e_success "Done!"
