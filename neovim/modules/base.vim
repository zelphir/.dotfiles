" ===================================
" Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ===================================
"{{{


if &shell =~# 'fish$'
  set shell=sh " Setting shell to sh if use fish
endif

set number                                  " Line numbers on
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=160                           " Don't try to syntax highlight minified files
set visualbell t_vb=                        " No Noise or bell
set mouse=a
set mat=3                                   " Blink matching brackets for 3 tenths of a second
set autoread
"}}}

" ----------------------------------
" Wrap/Indent settings {{{
" ----------------------------------
set wrap                                    " don't wrap lines
set showbreak=↳\ \
set linebreak
set breakindent
set breakindentopt=shift:2
set tabstop=2                               " a tab is two spaces
set shiftwidth=2                            " an autoindent (with <<) is two spaces
set expandtab                               " use spaces, not tabs
set autoindent
set backspace=indent,eol,start              " backspace through everything in insert mode
set whichwrap+=<,>,h,l,[,]                  " Allow left, right, bs, del to cross lines
set nrformats=                              " Treat all numbers as decimal
set scrolloff=5                             " Always show at least five lines below cursor
set sidescrolloff=10

set formatoptions+=t
set formatoptions-=l
" auto-wrap comments, auto insert comment header, allow formatting of comments
" with "gq" long lines are not broken in insert mode, don't break a line after
" a one letter word remove comment leader when joining lines
set formatoptions=crql1j
set copyindent                              " copy the previous indentation on autoindenting
set shiftround                              " round indent to multiples of shiftwidth
"}}}

" ----------------------------------
" Split settings (more natural) {{{
" ----------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
set fillchars=vert:│                        " Vertical sep for splits (unicode bar)
set nostartofline                           " Don't jump to col1 on switch buffer
"}}}

" ----------------------------------
" Timeout settings {{{
" ----------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ----------------------------------
" Spelling settings {{{
" ----------------------------------
" set spellfile=~/.config/nvim/dictionary.utf-8.add
" set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)
"}}}

" ----------------------------------
" Search settings {{{
" ----------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
"}}}

" ----------------------------------
" Persistent undo settings {{{
" ----------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo/
endif
"}}}

" ----------------------------------
" White characters settings {{{
" ----------------------------------
set list                                    " Show listchars by default
set listchars=eol:¬,tab:▸\ ,trail:•,extends:»,precedes:«
set showbreak=↪
"}}}

" ----------------------------------
" Filetype settings {{{
" ----------------------------------
filetype plugin on
filetype indent on
"}}}

" ----------------------------------
" Folding settings {{{
" ----------------------------------
set foldmethod=marker                       " Markers are used to specify folds. (indent)
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
"}}}

" ----------------------------------
" Color and highlights {{{
" ----------------------------------

" Listchars highlighting {{{
" highlight NonText ctermfg=235 guifg=gray
" highlight SpecialKey ctermfg=235 guifg=gray
"}}}

" Remove underline in folded lines {{{
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" Link highlight groups to improve buftabline colors {{{
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
"}}}
"}}}

" ----------------------------------
" Omni completion settings {{{
" ----------------------------------
" set completeopt-=preview                                   " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=.hg,.git,.svn                              " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg             " binary images
set wildignore+=*.sw?                                      " Vim swap files
set wildignore+=.DS_Store                                  " OSX
set wildignore+=**.rbc,*.class,*.gem                       " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz    " Disable archive files
set wildignore+=*/tmp/*
set wildignore+=*/coverage/*
set wildignore+=*.otf,*.woff,*.orig

" Ignore middleman build
set wildignore+=build

" Ignore middleman build
set wildignore+=node_modules
"}}}

" ----------------------------------
" Neovim specific settings {{{
" ----------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1               " Set an environment variable to use the t_SI/t_EI hack
let g:loaded_python_provider=1                    " Disable python 2 interface
let g:python_host_skip_check=1                    " Skip python 2 host check
let g:python3_host_prog='/usr/local/bin/python3'  " Set python 3 host program
"}}}

" ---------------------------------
" True colors settings {{{
" ---------------------------------
 if has('termguicolors')
   set termguicolors " Turn on true colors support
 endif
" }}}

"}}}

" --------------------------------
" Autocommands {{{
" --------------------------------

" autocmd FileType javascript,json,jsx setlocal suffixesadd+=.js,.json,.jsx

" Remove trailing whitespaces automatically before save {{{
autocmd BufWritePre * call utils#stripTrailingWhitespaces()
"}}}

" Resize splits when the window is resized {{{
autocmd VimResized * :wincmd =
"}}}

" Make sure Vim returns to the same line when you reopen a file. {{{
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif
"}}}

