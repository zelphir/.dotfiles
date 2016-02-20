#!/bin/bash

# Header logging
e_header() {
  local fmt="$(tput setaf 5)- $1$(tput sgr0)"; shift
  printf "$fmt\n" "$@"
}

#Finish logging
e_finish() {
  local fmt="$(tput setaf 64)$1$(tput sgr0)"; shift
  printf "\n$fmt" "$@"
}

# Success logging
e_success() {
  local fmt="$(tput setaf 64)✓ $1$(tput sgr0)"; shift
  printf "\n$fmt\n\n" "$@"
}

# Error logging
e_error() {
  local fmt="$(tput setaf 1)x $1$(tput sgr0)"; shift
  printf "$fmt\n" "$@"
}

# Warning logging
e_warning() {
  local fmt="$(tput setaf 136)Warning: $1$(tput sgr0)"; shift
  printf "$fmt\n" "$@"
}

# Running logging
e_running() {
  local fmt="$(tput setaf 6)⇒ $1 $(tput sgr0)"; shift
  printf "$fmt\n" "$@"
}

# Ask for confirmation before proceeding
seek_confirmation() {
  printf "\n"
  e_warning "$@"
  read -p "Continue? (y/n) " -n 1
  printf "\n"
}

# Test whether a command exists
# $1 - cmd to test
type_exists() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

# Test whether we're in a git repo
is_git_repo() {
  $(git rev-parse --is-inside-work-tree &> /dev/null)
}

# Test whether a Homebrew formula is already installed
# $1 - formula name (may include options)
formula_exists() {
  if $(brew list $1 >/dev/null); then
    printf "%s already installed.\n" "$1"
    return 0
  fi

  e_warning "Missing formula: $1"
  return 1
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      e_running "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      e_warning "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    e_running "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_launchctl_restart() {
  local name="$(brew_expand_alias "$1")"
  local domain="homebrew.mxcl.$name"
  local plist="$domain.plist"

  e_running "Restarting %s ..." "$1"
  mkdir -p "$HOME/Library/LaunchAgents"
  ln -sfv "/usr/local/opt/$name/$plist" "$HOME/Library/LaunchAgents"

  if launchctl list | grep -Fq "$domain"; then
    launchctl unload "$HOME/Library/LaunchAgents/$plist" >/dev/null
  fi
  launchctl load "$HOME/Library/LaunchAgents/$plist" >/dev/null
}
