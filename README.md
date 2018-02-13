# .dotfiles
My OSX setup (Tested on MacOS Sierra). It comes with:
* [Neovim](https://neovim.io/)
* [fish shell](https://fishshell.com/)
* [tmux](https://tmux.github.io/)
* [yarn](https://yarnpkg.com/)

...and more

## Getting started
#### Clone the repo in your `$HOME`

    cd ~
    git clone https://github.com/zelphir/.dotfiles
    cd .dotfiles

#### Install:

    ./install

#### Update:

    ./update

#### GitConfig
Change user/email in `~/.gitconfig`

Check the repo for more info!

## Custom tmux keymaps
I've change the tmux prefix from `<C-b>` to `<C-a>`
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
