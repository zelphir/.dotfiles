" ---
" Nerdtree
" ---
" Autoclose when closing last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeRespectWildIgnore = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeIgnore=['\~$', '\.git$']

map <leader>n :NERDTreeToggle<CR>
