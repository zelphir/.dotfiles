" ---
" Settings
" ---
set hidden
set mouse=a
set list                                  " Display unprintable characters f12 - switches
"set nowrap                               " don't wrap lines
set backspace=indent,eol,start            " allow backspacing over everything in insert mode
set autoindent                            " always set autoindenting on
set copyindent                            " copy the previous indentation on autoindenting
set number                                " always show line numbers
set shiftwidth=2                          " number of spaces to use for autoindenting
set shiftround                            " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                             " set show matching parenthesis
set ignorecase                            " ignore case when searching
set smartcase                             " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch                              " highlight search terms
set incsearch                             " show search matches as you type

set history=1000                          " remember more commands and search history
set undolevels=1000                       " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.class
set title                                 " change the terminal's title
set visualbell                            " don't beep
set noerrorbells                          " don't beep

set nobackup
set noswapfile

filetype plugin indent on

set listchars=eol:¬,tab:▸\ ,trail:•,extends:»,precedes:«

" Tab behavior
set smarttab
set expandtab
set tabstop=2

set clipboard=unnamed

set splitbelow
set splitright

set noshowmode
" ---
" Mappings
" ---
let mapleader=" "

" Clear highligh
nnoremap <leader><esc> :noh<return><esc>

" Learn it the hard way
nmap <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <leader>l :set list!<CR>
map <leader>w :set wrap!<CR>
map <leader>m :TagbarToggle<CR>

map <leader>, :bp!<CR>
map <leader>. :bn!<CR>
map <leader>x :bd<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
