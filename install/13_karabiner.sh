#!/bin/bash

e_header "Installing karabiner settings..."

if [ ! -d $CONFIG_DIR/karabiner ]; then
  ln -sf $DOTFILES_DIR/karabiner $CONFIG_DIR/karabiner
fi

karabiner="Karabiner-Elements-0.90.90.dmg"

wget -P /tmp https://github.com/wwwjfy/Karabiner-Elements/releases/download/0.90.90/${karabiner}
open /tmp/${karabiner}

e_success "Done!"

