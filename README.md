# .dotfiles
My OSX setup (Tested on MacOS Sierra). It comes with:
* [Neovim](https://neovim.io/)
* [fish shell](https://fishshell.com/)
* [tmux](https://tmux.github.io/)
* [iterm2](https://iterm2.com/)
* [yarn](https://yarnpkg.com/)
* [n Node Manager](https://github.com/tj/n)
* [Atom Beta](https://atom.io/beta)

...and more

## Getting started
#### Clone the repo in your `$HOME`

    cd ~
    git clone https://github.com/zelphir/.dotfiles

#### Install:

    bash ~/.dotfiles/install.sh

  _Enter root password when prompted_

#### Update:

    bash ~/.dotfiles/update.sh

  _Enter root password when prompted_

#### Manual steps
I suggest to remap the `CapsLock` key to `ESC/CTRL`.

#### GitConfig
Change user/email in `~/.gitconfig`

## What you get
* [Brew packages](https://github.com/zelphir/.dotfiles/blob/master/install/03_brew.sh)
* [Brew Cask apps](https://github.com/zelphir/.dotfiles/blob/master/install/04_brew-cask.sh)
* [Node global packages](https://github.com/zelphir/.dotfiles/blob/master/install/09_yarn_global.sh)
* [Atom packages](https://github.com/zelphir/.dotfiles/blob/master/atom/packages.list)

Check the repo for more info!

## Custom tmux keymaps
I've change the tmux prefix from `<C-b>` to `<C-a>` _(C is ctrl)_
* `<prefix>r`: Reload tmux config file
* `<prefix>\`: Split the window horizontally
* `<prefix>|`: Split the window vertically
* `<prefix>hjkl`: Move around panes
* `<prefix>x`: Close pane
* `<Alt>r`: Clear pane
* `<Alt>c`: Clear history pane
* `<Shift>arrows`: Resize panes up/down/left/right

## Custom Neovim keymaps
The `<leader>` is the `space`.
For the other keys check: [maps.vim](https://github.com/zelphir/.dotfiles/blob/master/neovim/maps.vim)

## Troubleshooting

If your Neovim doesn't perform well try to add a `local.vim` in `~/.config/nvim` with these settings:

    let g:indentLine_faster              = 1
    let g:indentLine_leadingSpaceEnabled = 1

Vim IndentLine plugin could slow vim down as it keeps redrawing everytime you move up and down
