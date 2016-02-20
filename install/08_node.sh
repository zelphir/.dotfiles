#!/bin/bash

e_header "Installing Node with n-installer"
curl -L http://git.io/n-install | N_PREFIX=$HOME/.n bash -s -- -y stable lts

e_success "Done!"
