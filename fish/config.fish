# Set env vars
set N_PREFIX $HOME/.n
set GOPATH $HOME/.go
set fish_path $HOME/.config/fish
set foreign_env $fish_path/plugins/foreign-env/functions
set ANDROID_HOME /usr/local/opt/android-sdk
set NVIM_HOME $HOME/.config/nvim/
set HOMEBREW_CASK_OPTS "--appdir=/Applications"
# set FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'
# set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set FZF_LEGACY_KEYBINDINGS 0
set FZF_TMUX 1
 
# Python virtualenv
set WORKON_HOME ~/.virtualenvs
# eval (python -m virtualfish)
 
# Set path
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $N_PREFIX/bin $HOME/.config/yarn/global/node_modules/.bin/ $PATH
 
# Set foreign-env
set fish_function_path $fish_function_path $foreign_env
 
# Set vi-mode
# fish_vi_mode
 
# Start tmux
if which tmux > /dev/null; and not set -q TMUX
  exec env TERM=xterm-256color tmux new-session -A
end
 
# No greeting
set fish_greeting
 
# Alias
alias v "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias reload ". $fish_path/config.fish"
alias a atom-beta
# eval (thefuck --alias | tr '\n' ';')
 
# Source sensitive configuration
if test -f $fish_path/local.fish
  source $fish_path/local.fish
end
 
# Set REACT editor
# set -x REACT_EDITOR atom-beta
