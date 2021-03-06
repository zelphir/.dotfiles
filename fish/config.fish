set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config

# Bootstrap fisher
if not functions -q fisher
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# asdf
if test -f /usr/local/opt/asdf/asdf.fish
  source /usr/local/opt/asdf/asdf.fish
end

# Set env vars
set -x EDITOR nvim
set -x GOPATH $HOME/.go
set -x NVIM_HOME $HOME/.config/nvim/
set -x BAT_THEME "Oceanic Next"
set -x WORKSPACE /Volumes/Workspace
set -x TSC_WATCHFILE 'UseFsEventsWithFallbackDynamicPolling'

# Settings for Homebrew and fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*" --glob "!package-lock.json" --glob "!yarn.lock" --glob "!node_modules/*"'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1
# set -x JENV_ROOT /usr/local/opt/jenv

# use vi-mode
set -U fish_key_bindings fish_vi_key_bindings
set fish_bind_mode insert

### PATH ###
if test -d /usr/local/sbin
  set homebrew /usr/local/bin /usr/local/sbin
else
  set homebrew /usr/local/bin
end

# set jenv /usr/local/opt/jenv/bin
set default_path /usr/bin /usr/sbin /bin /sbin
set gnubin /usr/local/opt/coreutils/libexec/gnubin
set gnused /usr/local/opt/gnu-sed/libexec/gnubin
set fzf /usr/local/opt/fzf/bin
set go $GOPATH/bin
set rust $HOME/.cargo/bin
set yarn $HOME/.yarn/bin
set yarn_global (yarn global bin)
set fish_user_paths $fzf $yarn $yarn_global $gnused $gnubin $homebrew $go $rust $default_path

# Start tmux
if [ (id -u) != 0 ]
  if not set -q TMUX
    exec tmux -u new-session -A
  end
end

if type -q fizzygit
  fizzygit
end

# The next line updates PATH for the Google Cloud SDK.
if test -f $HOME/google-cloud-sdk/path.fish.inc
  source $HOME/google-cloud-sdk/path.fish.inc
end

# Source aliases
if test -f $HOME/.config/fish/alias.fish
  source $HOME/.config/fish/alias.fish
end

# Source sensitive configuration
if test -f $HOME/Dropbox/.config/fish/local.fish
  source $HOME/Dropbox/.config/fish/local.fish
end

# Source completions
if test -f $HOME/.config/fish/completions.fish
  source $HOME/.config/fish/completions.fish
end

# status --is-interactive; and source (jenv init -|psub)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Volumes/Workspace/Kraken/slack-release-bot/node_modules/tabtab/.completions/serverless.fish ]; and . /Volumes/Workspace/Kraken/slack-release-bot/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Volumes/Workspace/Kraken/slack-release-bot/node_modules/tabtab/.completions/sls.fish ]; and . /Volumes/Workspace/Kraken/slack-release-bot/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Volumes/Workspace/Kraken/slack-release-bot/node_modules/tabtab/.completions/slss.fish ]; and . /Volumes/Workspace/Kraken/slack-release-bot/node_modules/tabtab/.completions/slss.fish
