#!/bin/bash

echo
echo "**********************************************************************"
echo "**** Running Bootstrap scripts... ****"
echo "**********************************************************************"
echo

# include my library helpers for colorized echo and require_brew, etc
source $HOME/.dotfiles/lib/vars.sh
source $DOTFILES_DIR/lib/utils.sh

FILES=install/test/*

for f in $FILES; do
  source "${f}"
done

echo
echo "**********************************************************************"
echo "**** Bootstrap script complete! Please restart your computer. ****"
echo "**********************************************************************"
echo
