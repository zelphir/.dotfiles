#!/bin/bash

e_header "Installing Cask and related software..."

apps=(
  # essential
  dropbox
  google-drive

  # browsers
  firefox
  firefoxdeveloperedition
  google-chrome
  google-chrome-canary

  # utility
  bartender
  flux
  istat-menus
  spectacle
  the-unarchiver
  1password

  # dev
  docker
  atom-beta
  iterm2-nightly
  java
  genymotion
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
brew_tap 'caskroom/fonts'

brew cask install ${apps[@]}

e_success "Done!"
