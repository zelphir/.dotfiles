"Plugin key settings

if dein#tap('coc.nvim')
  " Using CocList
  "
  " Show all diagnostics
  nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<cr>

  " Manage extensions
  nnoremap <silent> <leader>ce :<C-u>CocList extensions<cr>
  nnoremap <silent> <leader>cm :<C-u>CocList marketplace<cr>
  nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>co :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <leader>cj :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>ck :<C-u>CocPrev<CR>
  nnoremap <silent> <leader>cr :<C-u>CocListResume<CR>
  nnoremap <silent> <leader>cy :<C-u>CocList -A yank<cr>
  nnoremap <silent> <C-e> :CocCommand explorer<CR>

  nmap <leader>cn <Plug>(coc-rename)
  vmap <leader>cf  <Plug>(coc-format-selected)
  nmap <leader>cf  <Plug>(coc-format-selected)
  xmap <leader>ca  <Plug>(coc-codeaction-selected)
  nmap <leader>ca  <Plug>(coc-codeaction-selected)
  nmap <leader>cac  <Plug>(coc-codeaction)
  nmap <leader>cq  <Plug>(coc-fix-current)

  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> ]c <Plug>(coc-diagnostic-prev)
  nmap <silent> [c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K for show documentation in float window
  nnoremap <silent> K :call CocActionAsync('doHover')<CR>
  " use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap gs <Plug>(coc-git-chunkinfo)
  " show commit contains current position
  nmap gm <Plug>(coc-git-commit)

  nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>

  " float window scroll
  nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
  nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

  " multiple cursors
  nmap <silent> <C-c> <Plug>(coc-cursors-position)
  nmap <expr> <silent> <C-m> <SID>select_current_word()
  xmap <silent> <C-d> <Plug>(coc-cursors-range)
  " use normal command like `<leader>xi(`
  nmap <leader>x <Plug>(coc-cursors-operator)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

  function! s:select_current_word()
    if !get(g:, 'coc_cursors_activated', 0)
      return "\<Plug>(coc-cursors-word)"
    endif
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc
endif

if dein#tap('fzf.vim')
  nnoremap <silent> <leader>l :call Fzf_dev()<CR>
  nnoremap <silent> <leader>fc :Commits<CR>
  nnoremap <silent> <leader>fs :Snippets<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>fg :call Fzf_git_dev()<CR>
  nnoremap <silent> <leader>fr :Rg<CR>
  nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
  nnoremap <silent> <leader>fh :History<CR>
  nnoremap <silent> <LocalLeader>hc :History:<CR>
  nnoremap <silent> <LocalLeader>hs :History/<CR>
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-fugitive')
  nnoremap <silent> <Leader>gd :Gdiff<CR>
  nnoremap <silent> <Leader>gb :Gblame<CR>
  nnoremap <silent> <Leader>gs :Gstatus<CR>
endif

if dein#tap('vim-mundo')
  nnoremap <silent> <leader>m :MundoToggle<CR>
endif

if dein#tap('accelerated-jk')
  nmap <silent>j <Plug>(accelerated_jk_gj)
  nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-easymotion')
  nmap <Leader><Leader>w <Plug>(easymotion-w)
  nmap <Leader><Leader>f <Plug>(easymotion-f)
  nmap <Leader><Leader>b <Plug>(easymotion-b)
endif

if dein#tap('actionmenu.nvim')
  nmap <silent> <LocalLeader>s :call ActionMenuCodeActions()<CR>
  let s:code_actions = []

  func! ActionMenuCodeActions() abort
    let s:code_actions = CocAction('codeActions')
    let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
    call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
  endfunc

  func! ActionMenuCodeActionsCallback(index, item) abort
    if a:index >= 0
      let l:selected_code_action = s:code_actions[a:index]
      let l:response = CocAction('doCodeAction', l:selected_code_action)
    endif
  endfunc
endif
