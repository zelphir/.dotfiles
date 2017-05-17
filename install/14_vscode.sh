#!/usr/bin/env bash

e_header "Installing vscode config..."

VSCODE_PATH="$HOME/Library/Application Support/Code - Insiders/User"
EXTENSIONS=$(cat $DOTFILES_DIR/vscode/extensions)

rm "$VSCODE_PATH/settings.json"
rm "$VSCODE_PATH/keybindings.json"
rm -rf "$VSCODE_PATH/snippets"
ln -sf $DOTFILES_DIR/vscode/settings.json "$VSCODE_PATH/settings.json"
ln -sf $DOTFILES_DIR/vscode/keybindings.json "$VSCODE_PATH/keybindings.json"
ln -sf $DOTFILES_DIR/vscode/snippets "$VSCODE_PATH/snippets"

for extension in $EXTENSIONS; do
  code --install-extension $extension
done

e_success "Done!"
