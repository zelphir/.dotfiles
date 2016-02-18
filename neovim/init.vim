scriptencoding utf-8

" ---
" VimPlug
" ---
" Download and use vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/plug/vim-plug/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.config/nvim/autoload && cd ~/.config/nvim/autoload && ln -s ../plug/vim-plug/plug.vim .
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'rizzatti/dash.vim'
Plug 'hsanson/vim-resize'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim'
Plug 'kballard/vim-fish'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'jaxbot/syntastic-react'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'mhartington/oceanic-next'
Plug 'Raimondi/delimitMate'
Plug 'othree/yajs.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ---
"  Syntastic
" ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:jsx_ext_required = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint_d'

" ---
" The Silver Searcher
" ---
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ---
" Theme
" ---
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set noshowmode
set background=dark
set fillchars+=vert:│
set cursorline
set relativenumber
set foldenable
colorscheme OceanicNext

" ---
"  Deoplete
"  ---
let g:deoplete#enable_at_startup = 1

" ---
" Nerdtree
" ---
" Autoclose when closing last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeIgnore=['\~$', '\.git$']

" ---
"  IndentLine
"  ---
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = ''
let g:indentLine_char = ''

" ---
" Tagbar
" ---
let g:tagbar_compact = 1
"let g:Show_diagnostics_ui = 1 "default 1

" ---
" GitGutter Symbols
" ---
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '='

" ---
" AirLine
" ---
let g:airline_theme = 'oceanicnext'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ---
"  Editorconfig
" ---
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" ---
"  Mundo
"  ---
let g:mundo_preview_statusline = ''
let g:mundo_tree_statusline = ''

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
set smarttab                              " insert tabs on the start of a line according to shiftwidth, not tabstop
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

" ---
" Mappings
" ---
let mapleader=" "

" Learn it the hard way
nmap <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <leader>l :set list!<CR>
map <leader>w :set wrap!<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>m :TagbarToggle<CR>

map <leader>, :bp!<CR>
map <leader>. :bn!<CR>
map <leader>x :bd<CR>

nnoremap <up> :ResizeUp<CR>
nnoremap <down> :ResizeDown<CR>
nnoremap <left> :ResizeLeft<CR>
nnoremap <right> :ResizeRight<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
