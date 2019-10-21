" Keep selection after indent
vnoremap < <gv
vnoremap > >gv

" Always delete to blackhole register
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D

" Use X to cut a line
nnoremap X Vx

" Press enter for newline without insert
nnoremap <cr> o<esc>

" Prevent entering ex mode accidentally
nnoremap Q <Nop>

" Sort
vnoremap <leader>s :sort<CR>

" Reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>

" Disable search highlighting until next search
nnoremap <silent> <Esc> :noh<CR>

" Command line alias
" cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" When jump to next match also center screen
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Switch windw
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Smart move
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" Buffer navigation
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-x> :bd!<CR>

" Buffer
nnoremap <leader>bc :BufOnly<CR>
nnoremap <Leader>bo :BufOnly

" Buffer selection
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Settings for resize splitted window
noremap <right> <C-w>>
noremap <left> <C-w><
noremap <up> <C-w>+
noremap <down> <C-w>-

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" A command which edit PLugin config easy
" nnoremap <leader>p :EditPluginSetting <Space>

" Improve scroll, credits: https://github.com/Shougo
" nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
"       \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
" noremap <expr> <C-f> max([winheight(0) - 2, 1])
"       \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
" noremap <expr> <C-b> max([winheight(0) - 2, 1])
"       \ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
" noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
" noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Toggle wrap
nnoremap <leader>w :set wrap!<CR>

" Remap Capital letters for save and quit
command! -nargs=* -bang W w<bang> <args>
command! -nargs=* -bang Q q<bang> <args>
