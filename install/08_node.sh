#!/bin/bash

e_header "Installing Node with n-installer"

brew uninstall node

if [ ! -d $HOME/.n ]; then
  curl -L http://git.io/n-install | N_PREFIX=$HOME/.n bash -s -- -y latest
fi

e_success "Done!"
