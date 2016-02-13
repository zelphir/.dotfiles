# Set env vars
set -x N_PREFIX "$HOME/.n"
set -x fish_path $HOME/.config/fish
set -x foreign_env $fish_path/plugins/foreign-env/functions

# Set path
set -x PATH (brew --prefix coreutils)/libexec/gnubin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $N_PREFIX/bin

# Set foreign-env
set fish_function_path $fish_function_path $foreign_env

# Alias
alias v "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias restore ". $fish_path/config.fish"
