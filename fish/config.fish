# Set env vars
set -x N_PREFIX $HOME/.n
set -x GOPATH $HOME/.go
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x NVIM_HOME $HOME/.config/nvim/

# Settings for Homebrew and fzf
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set FZF_LEGACY_KEYBINDINGS 0
set FZF_TMUX 1
 
# Python virtualenv
# set WORKON_HOME ~/.virtualenvs
# eval (python -m virtualfish)

### PATH ###
set fish_path $HOME/.config/fish
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set node $N_PREFIX/bin
set yarn $HOME/.config/yarn/global/node_modules/.bin/
set -gx PATH $homebrew $node $yarn $default_path
 
# Start tmux
if which tmux > /dev/null; and not set -q TMUX
  exec env TERM=xterm-256color tmux new-session -A
end
 
# Alias
alias v "nvim"
alias vim "nvim"
alias r "trash"
alias a atom-beta
alias reload ". $fish_path/config.fish"
 
# Source sensitive configuration
if test -f $fish_path/local.fish
  source $fish_path/local.fish
end
