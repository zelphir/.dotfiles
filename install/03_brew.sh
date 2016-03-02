#!/bin/bash
e_header "Installing extra Homebrew formulae..."

# tap formulas
brew_tap homebrew/completions
brew_tap 'neovim/neovim'

# Install GNU core utilities (those that come with OS X are outdated).
brew_install_or_upgrade coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew_install_or_upgrade findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew_install_or_upgrade gnu-sed --with-default-names

# Install some tools
brew_install_or_upgrade dockutil
brew_install_or_upgrade trash
brew_install_or_upgrade tree
brew_install_or_upgrade wget --with-iri
brew_install_or_upgrade https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb
brew_install_or_upgrade neovim --HEAD
brew_install_or_upgrade fish --HEAD
brew_install_or_upgrade git
brew_install_or_upgrade htop
brew_install_or_upgrade gradle
brew_install_or_upgrade python
brew_install_or_upgrade python3
brew_install_or_upgrade watchman
brew_install_or_upgrade flow
brew_install_or_upgrade android-sdk
brew_install_or_upgrade the_silver_searcher
brew_install_or_upgrade ag
brew_install_or_upgrade ctags
brew_install_or_upgrade homebrew/completions/brew-cask-completion
brew_install_or_upgrade reattach-to-user-namespace
brew_install_or_upgrade vim --override-system-vi
brew_install_or_upgrade postgres
brew_install_or_upgrade docker
brew_install_or_upgrade docker-machine
brew_install_or_upgrade docker-compose

brew cleanup

e_success "Done!"