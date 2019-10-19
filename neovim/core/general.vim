" Enable true color
if has('termguicolors')
  set termguicolors
endif

set mouse+=a
set mousehide          " hide the mouse cursor while typing
set nobackup
set noswapfile
set autoread
set autowrite
set confirm
set splitbelow
set splitright
set bsdir=buffer
set noshowmode
set cursorline
set colorcolumn=100    " show a column at 100 chars

if has('vim_starting')
  set encoding=UTF-8
  scriptencoding UTF-8
endif

set laststatus=2
set showtabline=2
set statusline=-        " hide file name in statusline
set fillchars+=vert:\|  " add a bar for vertical splits

if has('mac')
  let g:clipboard = {
        \   'name': 'macOS-clipboard',
        \   'copy': {
        \      '+': 'pbcopy',
        \      '*': 'pbcopy',
        \    },
        \   'paste': {
        \      '+': 'pbpaste',
        \      '*': 'pbpaste',
        \   },
        \   'cache_enabled': 0,
        \ }
endif

if has('clipboard')
  set clipboard& clipboard+=unnamedplus
endif

set number
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=300
set undofile
set undodir=~/.tmp/undo
set relativenumber
set backspace=2
set backspace=indent,eol,start

" Tabs and Indents {{{
" ----------------
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set shiftround
" }}}
"
set hidden
set shortmess+=c
set signcolumn=auto:2
set completefunc=emoji#complete
set completeopt =longest,menu
set completeopt-=preview
set list
set listchars=eol:¬,tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set showbreak=↪\              " Wrap lines character
set linebreak
set breakindent
set breakindentopt=shift:2
set nowrap                    " disable line wrapping
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap too

set lazyredraw      " no unneeded redraws
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set grepprg=rg\ --vimgrep\ $*
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*

if has('conceal')
  set conceallevel=3 concealcursor=niv
endif

" Load local vim settings
set exrc
set secure

" Vim Directories {{{
" ---------------
set undofile swapfile nobackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
set nospell spellfile=$NVIM_HOME/spell/en.utf-8.add

" History saving
set history=1000
set shada='300,<50,@100,s10,h

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
      \ && $HOME !=# expand('~'.$USER)
      \ && $HOME ==# expand('~'.$SUDO_USER)

  set noswapfile
  set nobackup
  set nowritebackup
  set noundofile
  set shada="NONE"
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
  set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
  set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup MyAutoCmd
  autocmd!
  silent! autocmd BufNewFile,BufReadPre
        \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
        \ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

if has('folding')
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=99
endif

" Delete empty buffer
if bufname('%') == ''
  set bufhidden=wipe
endif

" Reload files if changed outside neovim
augroup MyAutoCmd
  autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
  autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
