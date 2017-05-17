#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source $HOME/.dotfiles/lib/vars.sh
source $DOTFILES_DIR/lib/utils.sh

echo
e_running "Running Bootstrap scripts...\n"

FILES=install/*.sh

for f in $FILES; do
  source "${f}"
done

e_finish "Bootstrap script complete!\n\n"
