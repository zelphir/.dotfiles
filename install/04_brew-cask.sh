#!/usr/bin/env bash

e_header "Installing Cask and related software..."

apps=(
  # essential
  dropbox
  google-drive
  box-sync
  private-internet-access

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
  jumpshare
  real-vnc

  # dev
  insomnia
  docker
  atom-beta
  iterm2-nightly
  genymotion
  screenhero
  visual-studio-code-insiders

  # others
  sketch
  hacker-menu
  skype
  slack
  telegram
  whatsapp
  vlc
  transmission

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
