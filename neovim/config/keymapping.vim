" Keys
" -----------------------------------------------------------------

  " set leader to space
  let g:mapleader = ' '

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
  nnoremap <silent> <Esc> :noh<CR>

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

  " Remap Capital letters for save and quit
  command! -nargs=* -bang W w<bang> <args>
  command! -nargs=* -bang Q q<bang> <args>

" Plugins
" -----------------------------------------------------------------
" Fzf
map <leader>b :Buffers<cr>
map <leader>l :Files<cr>
map <leader>g :GFiles?<cr>
map <leader>/ :Rg!<cr>

" Format with Prettier
nmap gp <Plug>(ale_fix)

" Completion Manager
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" NERDTree
map <C-e> :NERDTreeToggle<CR>