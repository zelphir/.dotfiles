#!/usr/bin/env bash

# Install homebrew
e_header "Check/Install/Update HomeBrew"

if type_exists 'brew'; then
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

e_success "Done!"
