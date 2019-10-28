"CoC config
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_global_extensions = [
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-emmet',
      \ 'coc-tsserver',
      \ 'coc-pairs',
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-lists',
      \ 'coc-yaml',
      \ 'coc-template',
      \ 'coc-marketplace',
      \ 'coc-gitignore',
      \ 'coc-yank',
      \ 'coc-explorer',
      \ 'coc-go',
      \ 'coc-rls'
      \ ]

augroup MyAutoCmd
  autocmd!
  if exists("*CocActionAsync")
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  endif
augroup end

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
