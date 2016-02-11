#!/bin/bash

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

################################################################################
# Check/Install Xcode and Homebrew
################################################################################

# Install xcode command line tool
check_xcode

e_header "Check/Install HomeBrew"
# Install homebrew
if type_exists 'brew'; then
  brew update
  brew upgrade --all
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
(cd ~/Library/Fonts ; curl -fLo "Sauce Code Pro Light Nerd Font Complete Mono" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Light/complete/Sauce%20Code%20Pro%20Light%20Nerd%20Font%20Complete%20Mono.ttf)
(cd ~/Library/Fonts ; curl -fLo "Sauce Code Pro Medium Nerd Font Plus Octicons" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Medium/additional-variations/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Plus%20Octicons.ttf)

e_success "Done!"

################################################################################
# Install extra Homebrew packages
################################################################################

e_running "Installing extra Homebrew formulae..."
source "$DOTFILES_DIR/install/brew"

e_success "Done!"

################################################################################
# Install Neovim config and plugins
################################################################################

e_running "Installing Neovim config and plugins..."

if [ ! -d ~/.config/nvim ]; then
  mkdir ~/.config/nvim
fi

install_nvim_folder

e_success "Done!"

################################################################################
# Install tmux config
################################################################################

e_running "Installing tmux config..."

if [ ! -f ~/.tmux.conf ]; then
  ln -sf $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf
fi

e_success "Done!"

################################################################################
# Install Cask and related software
################################################################################

e_running "Installing Cask and related software..."
source "$DOTFILES_DIR/install/brew-cask"

e_success "Done!"

################################################################################
# Install Node with NVM
################################################################################

e_running "Installing Node via nvm"
source "$DOTFILES_DIR/install/nvm"

e_success "Done!"

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

################################################################################
# Install fisherman for fish 
################################################################################

e_running "Installing fisherman"
curl -sL install.fisherman.sh | fish
chsh -s `which fish` $USER
source "$DOTFILES_DIR/install/fisherman.sh"

e_success "Done!"
