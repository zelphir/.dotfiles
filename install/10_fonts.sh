#!/bin/bash
e_header "Install fonts"


cp $DOTFILES_DIR/fonts/*.otf $HOME/Library/Fonts/
brew cask install font-fira-code

e_success "Done!"
