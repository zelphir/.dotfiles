#!/bin/bash

e_header "Installing Cask and related software..."

apps=(
  # essential
  dropbox
  google-drive

  # browsers
  firefox
  google-chrome-beta

  # utility
  bartender
  flux
  istat-menus
  spectacle
  the-unarchiver
  screenhero

  # dev
  atom-beta
  iterm2-beta
  sublime-text-dev
  android-studio
  java
  genymotion
  karabiner
  psequel
  react-native-debugger

  # others
  sketch
  hacker-menu
  skype
  slack
  telegram
  whatsapp
  vlc
  infinit
  transmission

  # Fonts
  caskroom/fonts/font-hack

  # quicklook plugins
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlprettypatch
  quicklook-csv
  betterzipql
  qlimagesize
  webpquicklook
  suspicious-package
)

brew_tap 'caskroom/cask'
brew_tap 'caskroom/versions'

brew cask install ${apps[@]}

e_success "Done!"
