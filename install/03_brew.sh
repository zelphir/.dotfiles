#!/bin/bash
e_header "Installing extra Homebrew formulae..."

# tap formulas
brew_tap homebrew/completions
brew_tap 'neovim/neovim'
brew tap facebook/fb

brews=(
  # Install GNU core utilities (those that come with OS X are outdated).
  "coreutils"

  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  "findutils"

  # Install GNU `sed`, overwriting the built-in `sed`.
  "gnu-sed --with-default-names"

  # Install some tools"
  "fzf"
  "ranger"
  "dockutil"
  "trash"
  "tree"
  "wget --with-iri"
  "https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb"
  "neovim --HEAD"
  "fish --HEAD"
  "buck --HEAD"
  "git"
  "fortune"
  "cowsay"
  "htop"
  "gradle"
  "python3"
  "watchman"
  "flow"
  "android-sdk"
  "the_silver_searcher"
  "ag"
  "ctags"
  "homebrew/completions/brew-cask-completion"
  "reattach-to-user-namespace"
  "thefuck"
)

for i in "${brews[@]}"; do
  brew_install_or_upgrade $i
done

brew cleanup

e_success "Done!"
