#!/bin/bash

e_header "Install npm packages..."

apps=(
  create-react-app
  react-native-cli
  eslint
  standard
  babel
  tern
)

if !(type_exists $HOME/.n/bin/${apps[@]}); then
  yarn global add ${apps[@]}
fi

e_success "Done!"
