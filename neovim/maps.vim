" Keys
" -----------------------------------------------------------------

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

  " Reset search highlight
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

  " Visual linewise up and down by default (and use gj gk to go quicker)
  nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
  nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap gj 5j
  nnoremap gk 5k
  vnoremap j gj
  vnoremap k gk
  vnoremap gj 5j
  vnoremap gk 5k

  " When jump to next match also center screen
  " Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
  nnoremap <silent> n :norm! nzz<CR>
  nnoremap <silent> N :norm! Nzz<CR>
  vnoremap <silent> n :norm! nzz<CR>
  vnoremap <silent> N :norm! Nzz<CR>

  " Same when moving up and down
  nnoremap <C-u> <C-u>zz
  nnoremap <C-d> <C-d>zz
  nnoremap <C-f> <C-f>zz
  nnoremap <C-b> <C-b>zz
  vnoremap <C-u> <C-u>zz
  vnoremap <C-d> <C-d>zz
  vnoremap <C-f> <C-f>zz
  vnoremap <C-b> <C-b>zz

  " Remap H and L (top, bottom of screen to left and right end of line)
  nnoremap H ^
  nnoremap L $
  vnoremap H ^
  vnoremap L g_

  " More logical Y (default was alias for yy)
  nnoremap Y y$

  " Buffer navigation
  nnoremap <C-n> :bn<CR>
  nnoremap <C-p> :bp<CR>
  nnoremap <C-x> :bd!<CR>

  " Toggle wrap
  nnoremap <leader>w :set wrap!<CR>

" Plugins
" -----------------------------------------------------------------
  " Netrw
  nnoremap <C-e> :Lexplore<CR>

  " Fzf
  map <leader>b :Buffers<cr>
  map <leader>f :Files<cr>
  map <leader>g :GFiles?<cr>
  map <leader>t :Tags<cr>
  map <leader>/ :Rg!<cr>

  " Deoplete
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " SuperTab like snippets behavior.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  xmap <C-k>     <Plug>(neosnippet_expand_target)