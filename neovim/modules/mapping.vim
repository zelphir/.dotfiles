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

map <leader>w :set wrap!<CR>
map <leader>m :TagbarToggle<CR>

map <leader>, :bp!<CR>
map <leader>. :bn!<CR>
map <leader>x :bd<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Move by visual line.
nnoremap j gj
nnoremap k gk

noremap - :Autoformat<CR>
