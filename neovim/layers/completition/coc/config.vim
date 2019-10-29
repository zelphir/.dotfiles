"CoC config
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

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <C-R> =...<CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
