"Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_source_history_yank_enable = 1
let g:unite_prompt='‣ '
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden -g --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''node_modules'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
nnoremap <C-P> :Unite -buffer-name=files -start-insert -ignorecase file_rec/async:!<CR>
nnoremap <leader>/ :Unite -vertical grep:. -buffer-name=search-buffer<CR>
nnoremap <leader>s :Unite -quick-match buffer<CR>

call unite#custom#profile('default', 'context', {
      \   'direction': 'botright',
      \   'vertical_preview': 1,
      \   'winheight': 35,
      \   'short-source-names': 1,
      \ })

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)

  nmap <silent><buffer><expr> Enter unite#do_action('switch')
  nmap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
  nmap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
  nmap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')

  imap <silent><buffer><expr> Enter unite#do_action('switch')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
  imap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')

  map <buffer> <C-p> <Plug>(unite_toggle_auto_preview)
  map <buffer> <C-c> <Plug>(unite_redraw)

  nnoremap <ESC> :UniteClose<cr>
endfunction
