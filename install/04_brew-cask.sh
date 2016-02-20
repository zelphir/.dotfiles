#!/bin/bash

e_running "Installing Cask and related software..."

apps=(
  # essential
  dropbox
  google-drive

  # browsers
  firefox
  google-chrome

  # utility
  bartender
  flux
  istat-menus
  spectacle
  the-unarchiver

  # dev
  iterm2-beta
  sublime-text3
  virtualbox
  java
  genymotion
  karabiner

  # others
  sketch
  hacker-menu
  skype
  vlc

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
