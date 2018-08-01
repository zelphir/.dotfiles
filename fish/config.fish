# Source sensitive configuration
if test -f $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end

# Set env vars
set GOPATH $HOME/.go
set JAVA_HOME (/usr/libexec/java_home)
set ANDROID_SDK_ROOT /usr/local/share/android-sdk
set ANDROID_HOME /usr/local/share/android-sdk
set NVIM_HOME $HOME/.config/nvim/
set -x N_PREFIX $HOME/.n

# Settings for Homebrew and fzf
set HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1

### PATH ###
if test -d /usr/local/sbin
  set homebrew /usr/local/bin /usr/local/sbin
else
  set homebrew /usr/local/bin
end

set fish_path $HOME/.config/fish
set python2_path /usr/local/opt/python@2/bin
set default_path /usr/bin /usr/sbin /bin /sbin
set gnubin /usr/local/opt/coreutils/libexec/gnubin
set node $HOME/.n/bin
set fish_user_paths $python2_path $gnubin $homebrew $node $default_path

# use vi-mode
set fish_key_bindings fish_vi_key_bindings
set fish_bind_mode insert

# Start tmux
if [ (id -u) != 0 ]
  if which tmux > /dev/null; and not set -q TMUX
    exec tmux new-session -A
  end
end

# Alias
function v --wraps nvim -d 'alias v=nvim'
  nvim $argv
end

function r --wraps trash -d 'alias r=trash'
  trash $argv
end

function reload
  . $fish_path/config.fish
end

function work
  cd /Volumes/Data/Workspace
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.fish.inc' ]
  source '~/google-cloud-sdk/path.fish.inc'
end

# asdf
source ~/.asdf/asdf.fish
