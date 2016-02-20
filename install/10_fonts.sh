#!/bin/bash

e_header "Installing fixed-width fonts patched for use with Powerline symbols..."

curl --url https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/S-DZ/additional-variations/Meslo%20LG%20S%20DZ%20Regular%20for%20Powerline%20Nerd%20Font%20Plus%20Octicons.otf -o ~/Library/Fonts/Meslo.otf

e_success "Done!"
