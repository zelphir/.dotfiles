#!/usr/bin/env bash
e_header "Install python env"

pip install --user neovim jedi mistune psutil setproctitle vim-vint virtualfish
pip3 install --user neovim jedi mistune psutil setproctitle vim-vint virtualfish

e_success "Done!"
