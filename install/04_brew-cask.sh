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

for i in "${apps[@]}"; do
  $(brew cask list $i > /dev/null) && brew cu $i || brew cask install $i
done

brew cask cleanup

e_success "Done!"
