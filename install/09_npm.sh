#!/bin/bash

e_header "Install npm packages..."

apps=(
  gulp
  react-native-cli
  eslint
  standard
  jscs
  babel
  js-beautify
  html-beautify
  npm-check
  flow-bin
  tern
)

if !(type_exists $HOME/.n/bin/${apps[@]}); then
  $HOME/.n/bin/npm install -g ${apps[@]}
fi

e_success "Done!"
