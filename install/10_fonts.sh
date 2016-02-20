#!/bin/bash

e_running "Installing fixed-width fonts patched for use with Powerline symbols..."

cd ~/Library/Fonts ; curl -fLo "Meslo LG S DZ Regular for Powerline Nerd Font Plus Octicons.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/S-DZ/additional-variations/Meslo%20LG%20S%20DZ%20Regular%20for%20Powerline%20Nerd%20Font%20Plus%20Octicons.otf

e_success "Done!"
