#!/usr/bin/env bash

################################################################################
# bootstrap
#
# This script is intended to set up a new Mac computer with my dotfiles and
# other development preferences.
################################################################################

echo
echo "**********************************************************************"
echo "**** Running Bootstrap scripts... ****"
echo "**********************************************************************"
echo

# include my library helpers for colorized echo and require_brew, etc
source $HOME/.dotfiles/lib/vars.sh
source $DOTFILES_DIR/lib/utils.sh

# Install xcode command line tool
check_xcode

# Install homebrew
if type_exists 'brew'; then
	brew update
else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


################################################################################
# Setup dotfiles
################################################################################

e_running "Installing dotfiles..."
source $DOTFILES_DIR/dotfiles.sh

e_success "Done!"


################################################################################
# Install Powerline-patched fonts
################################################################################

e_running "Installing fixed-width fonts patched for use with Powerline symbols..."
if [ -d "$HOME/fonts" ]; then
  rm -rf $HOME/fonts
fi
git clone https://github.com/powerline/fonts.git $HOME/fonts
cd $HOME/fonts
./install.sh
cd $HOME
rm -rf $HOME/fonts

e_success "Done!"


################################################################################
# Install Vundle and vim plugins
################################################################################

#e_running "Installing Vundle and vim plugins..."
#if [ -d $HOME/.vim/bundle ]; then
#  rm -rf $HOME/.vim/bundle
#fi
#git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
#cp -R $DOTFILES_DIR/vim/colors $HOME/.vim # So vim won't complain about solarized not being found.
#vim +PluginInstall +qall
#rm -rf $HOME/.vim/colors
#
#e_success "Done!"


################################################################################
# Install extra Homebrew packages
################################################################################

e_running "Installing extra Homebrew formulae..."
brew_tap 'neovim/homebrew-neovim'
brew_tap 'neovim/neovim'
source "$DOTFILES_DIR/install/brew"

e_success "Done!"


################################################################################
# Setup prezto
################################################################################

if [ ! -d "$HOME/.zprezto" ]; then
  e_running "Installing prezto (zsh)"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  
  e_success "Done!"
fi


################################################################################
# Install Cask and related software
################################################################################

e_running "Installing Cask and related software..."

brew_tap 'caskroom/cask'
brew_tap 'caskroom/versions'
source "$DOTFILES_DIR/install/brew-cask"

e_success "Done!"


################################################################################
# Install Node with NVM 
################################################################################

e_running "Installing Node via nvm"

source "$DOTFILES_DIR/install/nvm"


################################################################################
# Install npm packages
################################################################################

e_running "Install npm packages..."

source "$DOTFILES_DIR/install/npm"

e_success "Done!"


################################################################################
# Set OS X preferences
################################################################################

e_running "Setting OS X preferences..."

source "$DOTFILES_DIR/install/osx-defaults"
source "$DOTFILES_DIR/install/osx-dock"

e_success "Done!"


echo
echo "**********************************************************************"
echo "**** Bootstrap script complete! Please restart your computer. ****"
echo "**********************************************************************"
echo
