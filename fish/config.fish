# Auto install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set env vars
set -x EDITOR nvim
set -x GOPATH $HOME/.go
set JAVA_HOME (/usr/libexec/java_home)
set ANDROID_SDK_ROOT /usr/local/share/android-sdk
set ANDROID_HOME /usr/local/share/android-sdk
set NVIM_HOME $HOME/.config/nvim/
set -x N_PREFIX $HOME/.n
set -x BAT_THEME "Oceanic Next"

# Settings for Homebrew and fzf
set HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -U FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_TMUX 1

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
set fzf /usr/local/opt/fzf/bin
set node $HOME/.n/bin
set go $GOPATH/bin
set rust $HOME/.cargo/bin
set fish_user_paths $fish_user_paths $fzf $python2_path $gnubin $homebrew $node $go $rust $default_path

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
if test -f $HOME/.asdf/asdf.fish
  source $HOME/.asdf/asdf.fish
end

# Source sensitive configuration
if test -f $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end
