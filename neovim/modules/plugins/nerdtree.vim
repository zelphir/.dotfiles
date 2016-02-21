" ---
" Nerdtree
" ---
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeIgnore=['\~$', '\.git$']

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>ff :NERDTreeFind<CR>

let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1


" Close vim if only nerdtree is left open
augroup grass_nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
