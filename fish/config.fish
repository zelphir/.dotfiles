# Bootstrap fisher
if not functions -q fisher
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# use vi-mode
set -U fish_key_bindings fish_vi_key_bindings
set fish_bind_mode insert

# Set env vars
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
set -x EDITOR nvim
set -x GOPATH $HOME/.go
set JAVA_HOME (/usr/libexec/java_home)
set ANDROID_SDK_ROOT /usr/local/share/android-sdk
set ANDROID_HOME /usr/local/share/android-sdk
set -x NVIM_HOME $HOME/.config/nvim/
set -x N_PREFIX $HOME/.n
set -x BAT_THEME "Oceanic Next"
set -x WORKSPACE /Volumes/Workspace
set -x TSC_WATCHFILE 'UseFsEventsWithFallbackDynamicPolling'

# Settings for Homebrew and fzf
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*" --glob "!package-lock.json" --glob "!yarn.lock" --glob "!node_modules/*"'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1

### PATH ###
if test -d /usr/local/sbin
  set homebrew /usr/local/bin /usr/local/sbin
else
  set homebrew /usr/local/bin
end

# set fish_path $HOME/.config/fish
# set python2_path /usr/local/opt/python@2/bin
set default_path /usr/bin /usr/sbin /bin /sbin
set gnubin /usr/local/opt/coreutils/libexec/gnubin
set gnused /usr/local/opt/gnu-sed/libexec/gnubin
set fzf /usr/local/opt/fzf/bin
set node $HOME/.n/bin
set go $GOPATH/bin
set rust $HOME/.cargo/bin
set fish_user_paths $fzf $gnused $gnubin $homebrew $node $go $rust $default_path

# Start tmux
if [ (id -u) != 0 ]
  if which tmux > /dev/null; and not set -q TMUX
    exec tmux -u new-session -A
  end
end

if type -q fizzygit
  fizzygit
end

# The next line updates PATH for the Google Cloud SDK.
if test -f '~/google-cloud-sdk/path.fish.inc'
  source '~/google-cloud-sdk/path.fish.inc'
end

# asdf
if test -f $HOME/.asdf/asdf.fish
  source $HOME/.asdf/asdf.fish
end

# Source aliases
if test -f $HOME/.config/fish/alias.fish
  source $HOME/.config/fish/alias.fish
end

# Source sensitive configuration
if test -f $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end

# Source completions
if test -f $HOME/.config/fish/completions.fish
  source $HOME/.config/fish/completions.fish
end
