#!/bin/bash
e_header "Installing extra Homebrew formulae..."

# tap formulas
brew tap homebrew/completions
brew tap neovim/neovim
brew tap facebook/fb
brew tap jhawthorn/fzy
brew tap davepgreene/cask-upgrade
brew tap caskroom/versions
brew tap caskroom/fonts

brews=(
  # Install GNU core utilities (those that come with OS X are outdated).
  "coreutils"

  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  "findutils"

  # Install GNU `sed`, overwriting the built-in `sed`.
  "gnu-sed --with-default-names"

  # Install some tools"
  "bash"
  "yarn --ignore-dependencies"
  "fzf --HEAD"
  "trash"
  "tree"
  "wget --with-iri"
  "tmux"
  "neovim --HEAD"
  "fish --HEAD"
  "ripgrep --HEAD"
  "git"
  "fortune"
  "cowsay"
  "htop"
  "python"
  "python3"
  "watchman"
  "flow"
  "android-sdk"
  "ctags"
  "homebrew/completions/brew-cask-completion"
  "reattach-to-user-namespace"
)

for i in "${brews[@]}"; do
  if $(brew list $i >/dev/null); then
    if [[ $i == *"HEAD"* ]]; then
      brew upgrade --fetch-HEAD ${i/--HEAD/""}
    else
      brew upgrade $i
    fi
  else
    brew install $i
  fi
done

brew cleanup

# TODO: move
sudo gem install coderay

e_success "Done!"
