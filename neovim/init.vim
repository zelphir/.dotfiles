" Wraps paths to make them relative to this directory.
function! Dot(path)
  return "$HOME/.config/nvim/" . a:path
endfunction

execute 'source' Dot('settings.vim')
execute 'source' Dot('keys.vim')

" Vim-plug plugins
call plug#begin('~/.local/share/nvim/plugged')
execute 'source' Dot('plugins.vim')
call plug#end()

execute 'source' Dot('plugins_settings.vim')
execute 'source' Dot('theme.vim')

" Settings
" let mapleader=" "
" 
" let g:python_host_prog='/usr/local/bin/python'
" let g:python3_host_prog='/usr/local/bin/python3'
" 
" set termguicolors
" syntax enable
" syntax sync minlines=256
" colorscheme OceanicNext
" 
" set cursorline
" set colorcolumn=80
" set lazyredraw
" set synmaxcol=128 " Maximum column in which to search for syntax items
" set relativenumber
" set number
" set hidden
" set history=100
" filetype indent on
" set nowrap
" set tabstop=2
" set shiftwidth=2
" set expandtab
" set smartindent
" set autoindent
" set hlsearch
" set showmatch
" 
" " Mapping
" map <leader>s :source $HOME/.config/nvim/init.vim<CR>
" nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" nnoremap <C-p> :FuzzyOpen<CR>
" nnoremap <C-f> :FuzzyGrep<CR>
