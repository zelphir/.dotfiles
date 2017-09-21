#!/usr/bin/env bash
e_header "Install fonts"


cp $DOTFILES_DIR/fonts/*.otf $HOME/Library/Fonts/
brew cask install font-fira-code
brew cask install font-fira-sans

e_success "Done!"
