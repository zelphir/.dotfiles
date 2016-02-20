#!/bin/bash

e_running "Install npm packages..."

apps=(
  gulp
  react-native-cli
  eslint
  zelphir/eslint_d.js
  rnpm
  npm-check
)

if !(type_exists $HOME/.n/bin/${apps[@]}); then
  $HOME/.n/bin/npm install -g ${apps[@]}
fi

e_success "Done!"
