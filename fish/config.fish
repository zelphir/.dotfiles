# Set path
set -x PATH (brew --prefix coreutils)/libexec/gnubin $HOME/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin

# Fish/Fisher env vars
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
set fish_config ~/.config/fish/config.fish

# Load fisher config
source $fisher_home/config.fish

# Nvm prefix env var for the fish nvm plugin
set -gx nvm_prefix (brew --prefix nvm)

# Set where to install casks
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Alias
alias v "NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vim "NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias restore ". $fish_config"

