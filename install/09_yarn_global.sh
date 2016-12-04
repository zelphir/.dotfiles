#!/bin/bash

e_header "Install npm packages..."

apps=(
  gulp
  react-native-cli
  eslint
  standard
  babel
  tern
)

if !(type_exists $HOME/.n/bin/${apps[@]}); then
  yarn ${apps[@]}
fi

e_success "Done!"
