" Keys
  " set leader to space
  let mapleader = " "

  " adjust window size with arrow keys
  noremap <right> <C-w>>
  noremap <left> <C-w><
  noremap <up> <C-w>+
  noremap <down> <C-w>-

  " keep selection after indent
  vnoremap < <gv
  vnoremap > >gv

  " always delete to blackhole register
  nnoremap d "_d
  vnoremap d "_d
  nnoremap D "_D
  vnoremap D "_D

  " use X to cut a line
  nnoremap X Vx

  " press enter for newline without insert
  nnoremap <cr> o<esc>

  " prevent entering ex mode accidentally
  nnoremap Q <Nop>

  " sort
  vnoremap <leader>s :sort<CR>

  " reload vim config
  nnoremap <leader>r :source $MYVIMRC<CR>

  " disable search highlighting until next search
  nnoremap <leader>c :noh<CR>

	" Reset search
	nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

  " plugins

	" Fzy
	nnoremap <C-p> :FuzzyOpen<CR>
	nnoremap <C-f> :FuzzyGrep<CR>

" map <leader> <Plug>(easymotion-prefix)
" nnoremap <leader>g :GitGutterToggle<CR>
" nnoremap <leader>% :MtaJumpToOtherTag<CR>
" nnoremap <leader>n :NERDTreeToggle<CR>

" " move through deoplete suggestions with tab
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Autocommands
" if has("autocmd")

"   " disable comment continuation
"   autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"   " set neomake's eslint path to the local eslint, and enable it as a maker
"   autocmd BufEnter *.js,*.jsx let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
"   autocmd! BufEnter,BufWritePost * Neomake

"   " better syntax highlighting
"   autocmd BufNewFile,BufRead *eslintrc,*babelrc setlocal syntax=json

" endif

" Searching
" if executable('ag')

"   " use ag over grep
"   set grepprg=ag\ --nogroup\ --nocolor

"   " define Ag command
"   command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"   " bind \ to grep shortcut
"   nnoremap \ :Ag<SPACE>

" endif
