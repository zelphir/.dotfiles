#!/bin/bash

darwin_version=$(uname -r)

install_xcode() {
  if (( ${darwin_version%%.*} > 12 )); then
    e_header "Installing Xcode Command Line Tools. Follow the prompt"
    (xcode-select --install)
    seek_confirmation "Is Xcode done installing"

    if is_confirmed; then
      check_xcode
    else
      check_xcode
    fi
  else
    printf "  Download them from: https://developer.apple.com/downloads\n"
    exit 1
  fi
}

check_xcode() {
  if type_exists 'gcc'; then
    e_success "Xcode is installed"
  else
    e_warning "The Xcode Command Line Tools must be installed first."
    install_xcode
  fi
}


# Install xcode command line tool
e_header "Check Xcode"

check_xcode
