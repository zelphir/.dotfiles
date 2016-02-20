# Set env vars
set -x N_PREFIX $HOME/.n
set -x fish_path $HOME/.config/fish
set -x foreign_env $fish_path/plugins/foreign-env/functions
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x NEOVIM $HOME/.config/nvim/

# Python virtualenv
set -x WORKON_HOME ~/.virtualenvs
eval (python -m virtualfish)

# Set path
set -x PATH (brew --prefix coreutils)/libexec/gnubin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $N_PREFIX/bin

# Set foreign-env
set fish_function_path $fish_function_path $foreign_env

# Set vi-mode
# fish_vi_mode

# Start tmux
if which tmux > /dev/null; and not set -q TMUX
  exec tmux new-session -A -s main
end

# No greeting
set fish_greeting

# Alias
alias v "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias restore ". $fish_path/config.fish"
