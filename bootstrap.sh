#!/usr/bin/env bash

################################################################################
# bootstrap
#
# This script is intended to set up a new Mac computer with my dotfiles and
# other development preferences.
################################################################################

# include my library helpers for colorized echo and require_brew, etc
source $HOME/.dotfiles/lib/helper.sh


################################################################################
# Next, a little more setup...
################################################################################

set -e # Terminate script if anything exits with a non-zero value
set -u # Prevent unset variables


################################################################################
# Variable declarations
################################################################################

osname=$(uname)
COMMANDLINE_TOOLS="/Library/Developer/CommandLineTools"
DOTFILES_DIR=$HOME/.dotfiles

################################################################################
# Check for presence of command line tools if OS X
################################################################################

if [ ! -d "$COMMANDLINE_TOOLS" ]; then
  warn "Apple's command line developer tools must be installed before
running this script. To install them, just run 'gcc' from the terminal and
then follow the prompts. Once the command line tools have been installed,
you can try running this script again."
  exit 1
fi

################################################################################
# Setup prezto
################################################################################

if [ ! -d "$HOME/.zprezto" ]; then
  running "Installing prezto (zsh)"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  ok "Done!"
fi


################################################################################
# Setup dotfiles
################################################################################

running "Installing dotfiles..."
source $DOTFILES_DIR/dotfiles.sh

ok "Done!"


################################################################################
# Install Powerline-patched fonts
################################################################################

running "Installing fixed-width fonts patched for use with Powerline symbols..."
if [ -d "$HOME/src/fonts" ]; then
  rm -rf $HOME/src/fonts
fi
git clone https://github.com/powerline/fonts.git $HOME/src/fonts
cd $HOME/src/fonts
./install.sh
cd $HOME
rm -rf $HOME/src/fonts

ok "Done!"


################################################################################
# Install Vundle and vim plugins
################################################################################

#running "Installing Vundle and vim plugins..."
#if [ -d $HOME/.vim/bundle ]; then
#  rm -rf $HOME/.vim/bundle
#fi
#git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
#cp -R $DOTFILES_DIR/vim/colors $HOME/.vim # So vim won't complain about solarized not being found.
#vim +PluginInstall +qall
#rm -rf $HOME/.vim/colors
#
#ok "Done!"


################################################################################
# Install extra Homebrew packages
################################################################################

running "Installing extra Homebrew formulae..."
brew_tap 'neovim/homebrew-neovim'
brew_tap 'neovim/neovim'
source "$DOTFILES_DIR/install/brew"

ok "Done!"


################################################################################
# Install Cask and related software
################################################################################

running "Installing Cask and related software..."

brew_tap 'caskroom/cask'
brew_tap 'caskroom/versions'
source "$DOTFILES_DIR/install/brew-cask"

ok "Done!"


################################################################################
# Install Node with NVM 
################################################################################

running "Installing Node via nvm"

source "$DOTFILES_DIR/install/nvm"


################################################################################
# Set OS X preferences
################################################################################

running "Setting OS X preferences..."

source "$DOTFILES_DIR/install/osx-defaults"
source "$DOTFILES_DIR/install/osx-dock"

ok "Done!"


echo
echo "**********************************************************************"
echo "**** Mac Bootstrap script complete! Please restart your computer. ****"
echo "**********************************************************************"
echo
