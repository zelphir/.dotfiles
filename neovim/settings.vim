" General settings

  " base
  set encoding=utf-8
  set nocompatible                      " vim, not vi
  syntax on                             " syntax highlighting
  filetype plugin indent on             " try to recognise filetype and load plugins and indent files

  " interface
  set synmaxcol=128                     " maximum column in which to search for syntax items
  syntax sync minlines=256
  set colorcolumn=80                    " show a column at 100 chars
  set cursorline                        " highlight current line
  set laststatus=2                      " enable airline on open
  set noshowmode                        " don't show mode as airline already does
  set number                            " show line numbers
  set relativenumber                    " show relative line numbers
  set ruler                             " show current position at bottom
  set scrolloff=5                       " keep at least 5 lines above/below
  set shortmess+=I                      " disable welcome screen
  set showcmd                           " show any commands
  set sidescroll=1                      " smoother horizontal scrolling
  set sidescrolloff=5                   " keep at least 5 lines left/right
  set splitbelow                        " create new splits below
  set splitright                        " create new splits to the right
  set showmatch                         " show matching brackets when text indicator is over them
  set termguicolors                     " enable true colors
  set wildmenu                          " enable wildmenu
  set wildmode=longest:full,full        " configure wildmenu
  set visualbell                        " No Noise or bell
  set fillchars=vert:│                  " Vertical sep for splits (unicode bar)
  set nostartofline                     " Don't jump to col1 on switch buffer
  set nrformats=                        " Treat all numbers as decimal
  set scrolloff=5                       " Always show at least five lines below cursor

  " whitespace
  set expandtab                         " use tabs instead of spaces
  set nojoinspaces                      " use one space, not two, after punctuation
  set shiftround                        " shift to next tabstop
  set shiftwidth=2                      " amount of space used for indentation
  set softtabstop=2                     " appearance of tabs
  set tabstop=2                         " use two spaces for tabs

  " folding
  set foldmethod=indent                 " fold based on markers
  set nofoldenable                      " disable folds until `zc` or `zM` etc is used

  " text appearance
  set list                              " show invisible characters
  set listchars=eol:¬,tab:▸\ ,trail:•,extends:»,precedes:«
  set showbreak=↪\                      " Wrap lines character
  set linebreak
  set breakindent
  set breakindentopt=shift:2
  set nowrap                            " disable line wrapping

  " interaction
  set backspace=2                       " make backspace work like other apps
  set mouse=a                           " enable mouse support
  set mousehide                         " hide the mouse cursor while typing
  set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too
  set esckeys                           " allow cursor keys in insert mode

  " searching
  set hlsearch                          " highlight search matches
  set ignorecase                        " set case insensitive searching
  set incsearch                         " find as you type search
  set smartcase                         " case sensitive searching when not all lowercase

  " background processes
  set copyindent                        " copy the previous indentation on autoindenting
  set autoread                          " update file when changed outside of vim
  set autoindent                        " copy indentation from the previous line for new line
  set clipboard=unnamed                 " use native clipboard
  set hidden                            " hides buffers instead of closing them
  set history=200                       " store last 200 commands as history
  set lazyredraw                        " no unneeded redraws
  set nobackup                          " don't save backups
  set noerrorbells                      " no error bells please
  set noswapfile                        " no swapfiles
  set nowritebackup                     " don't save a backup while editing
  set ttyfast                           " indicates a fast terminal connection


  " persistent undo settings
  if has('persistent_undo')
    set undodir=~/.config/nvim/undo     " set undofile location
    set undofile                        " maintain undo history between sessions
    set undolevels=1000                 " store 1000 undos
  endif

  " character encoding
  if !&readonly
    set fileencoding=utf-8
  endif

 " Python bins
 let g:python_host_prog='/usr/local/bin/python'
 let g:python3_host_prog='/usr/local/bin/python3'
