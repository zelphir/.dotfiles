"Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_mru,file_rec,file_rec/neovim,grep,locate',
      \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
      \   'direction': 'botright',
      \   'short-source-names': 1,
      \ })

let g:unite_source_history_yank_enable = 1
let g:unite_prompt='‣ '
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <C-P> :Unite -buffer-name=files -start-insert -ignorecase file_rec/neovim:!<CR>
nnoremap <leader>/ :Unite -vertical grep:. -buffer-name=search-buffer<CR>
nnoremap <Leader>b :Unite -buffer-name=buffers buffer<CR>
nnoremap <Leader>h :Unite -buffer-name=history_yank history/yank<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Overwrite settings.
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-p> unite#do_action('preview')
endfunction
