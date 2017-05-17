#!/usr/bin/env bash

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
