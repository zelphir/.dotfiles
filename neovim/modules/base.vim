" Map Leaders
let mapleader = " "

if &shell =~# 'fish$'
  set shell=sh
endif

set number            " Show line numbers
syntax enable         " Turn on syntax highlighting allowing local overrides

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=300

" Time out on key codes but not mappings.  Basically this makes terminal Vim
" work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
set nowrap                                              " don't wrap lines
set tabstop=2                                           " a tab is two spaces
set shiftwidth=2                                        " an autoindent (with <<) is two spaces
set expandtab                                           " use spaces, not tabs
set autoindent
set copyindent                                          " copy the previous indentation on autoindenting
set shiftround                                          " round indent to multiples of shiftwidth
set clipboard=unnamed

" auto-wrap comments, auto insert comment header, allow formatting of comments
" with "gq" long lines are not broken in insert mode, don't break a line after
" a one letter word remove comment leader when joining lines
set formatoptions=crql1j

set list                                                " Display tabs and whitepace
set listchars=eol:¬,tab:▸\ ,trail:•,extends:»,precedes:«

set backspace=indent,eol,start                          " backspace through everything in insert mode
set whichwrap+=<,>,h,l,[,]                              " Allow left, right, bs, del to cross lines
set nrformats=                                          " Treat all numbers as decimal
set scrolloff=5                                         " Always show at least five lines below cursor
set sidescrolloff=10
set cursorline

set mat=3                                               " Blink matching brackets for 3 tenths of a second
set visualbell t_vb=                                    " No Noise or bell

set nopaste
set lazyredraw                                          " macros don't update display
set noshowcmd                                           " show incomplete commands (SLOW so off)
set noshowmode                                          " don't show -- INSERT -- in cmdline

set mouse=a

"Folding
set foldmethod=indent
set nofoldenable
set foldlevelstart=9999
