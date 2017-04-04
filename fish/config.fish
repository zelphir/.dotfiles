# Set env vars
set -x GOPATH $HOME/.go
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x NVIM_HOME $HOME/.config/nvim/

# Settings for Homebrew and fzf
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set FZF_LEGACY_KEYBINDINGS 0
set FZF_TMUX 1

# Python virtualenv
# set WORKON_HOME ~/.virtualenvs
# eval (python -m virtualfish)

### PATH ###
set fish_path $HOME/.config/fish
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set yarn $HOME/.config/yarn/global/node_modules/.bin
set gnubin (brew --prefix coreutils)/libexec/gnubin
set -gx PATH $gnubin $homebrew $yarn $default_path

# Start tmux
#if which tmux > /dev/null; and not set Q TMUX
#  exec env TERM=xterm256color tmux newSession A
#end

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

# Docker
function unsetdm -d "Unset DOCKER vars"
  set -e DOCKER_MACHINE_NAME
  set -e DOCKER_CERT_PATH
  set -e DOCKER_HOST
  set -e DOCKER_TLS_VERIFY
end

function setdm -d "Set docker machine env"
  eval (docker-machine env $argv)
end
