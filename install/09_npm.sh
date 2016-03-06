#!/bin/bash

e_header "Install npm packages..."

apps=(
  gulp
  react-native-cli
  eslint
  happiness
  standard
  jscs
  babel
  js-beautify
  html-beautify
  zelphir/eslint_d.js
  rnpm
  npm-check
)

if !(type_exists $HOME/.n/bin/${apps[@]}); then
  $HOME/.n/bin/npm install -g ${apps[@]}
fi

e_success "Done!"
