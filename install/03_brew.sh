#!/usr/bin/env bash
e_header "Installing extra Homebrew formulae..."

# tap formulas
brew tap neovim/neovim
brew tap facebook/fb
brew tap jhawthorn/fzy
brew tap davepgreene/cask-upgrade
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap scaleway/scaleway

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
  "tmux --HEAD"
  "neovim --HEAD"
  "fish --HEAD"
  "zplug"
  "ripgrep"
  "git"
  "htop"
  "python"
  "python3"
  "watchman"
  "flow"
  "ctags"
  "brew-cask-completion"
  "reattach-to-user-namespace --HEAD"
  "tidy-html5"

  # Scaleway for docker-machine
  "scaleway/scaleway/docker-machine-driver-scaleway"
  "scaleway/scaleway/scw --HEAD"
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
