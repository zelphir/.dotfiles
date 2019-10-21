"autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
"\| autocmd BufLeave <buffer> set laststatus=0 showmode ruler

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' 
      \ }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'FzfFloating'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

let g:fzf_commits_log_options = '--graph --color=always
      \ --format="%C(yellow)%h%C(red)%d%C(reset)
      \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" ripgrep
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF(0)' }

if executable('rg')
  let $FZF_PREVIEW_COMMAND = 'env COLORTERM=truecolor bat --color always --style numbers {}'
  set grepprg=rg\ --vimgrep

  command! -bang -nargs=* Rg
        \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
        \ 1,
        \ fzf#vim#with_preview({'options': '--delimiter : --nth 2..', 'window': 'call FloatingFZF()'}, 'down:70%'),
        \ <bang>0)
  command! -bang -nargs=* F
        \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
        \ .'"" '.<q-args>,
        \ 1,
        \ fzf#vim#with_preview({'options': '--delimiter : --nth 2..', 'window': 'call FloatingFZF()'}, 'down:70%'),
        \ <bang>0)
endif

function! FloatingFZF(...)
  let size = get(a:, 0, 1) ? 'small' : 'big'
  let resizes = {
        \ 'big': [10, 15],
        \ 'small': [&lines/1.8, &columns/2]
        \ }
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')

  if winwidth(0) > 160
    let resizes = {
          \ 'big': [&lines/3, &columns/4],
          \ 'small': [&lines/1.4, &columns/1.8]
          \ }
  endif

  let height = float2nr(&lines - (resizes[size][0]))
  let width = float2nr(&columns - (resizes[size][1]))
  let row = float2nr((&lines - height) / 2)
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
endfunction

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview-window right:70% --preview "env COLORTERM=truecolor bat --color always --style numbers {2..} | head -'.&lines.'"'

  function! s:edit_devicon_prepended_file(items)
    let items = a:items
    let i = 1
    let ln = len(items)
    while i < ln
      let item = items[i]
      let parts = split(item, ' ')
      let file_path = get(parts, 1, '')
      let items[i] = file_path
      let i += 1
    endwhile
    call s:Sink(items)
  endfunction

  let opts = fzf#wrap({})
  let opts.source = $FZF_DEFAULT_COMMAND.' | devicon-lookup'
  let s:Sink = opts['sink*']
  let opts.window = 'call FloatingFZF()'
  let opts['sink*'] = function('s:edit_devicon_prepended_file')
  let opts.options .= ' -m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up '. l:fzf_files_options
  call fzf#run(opts)
endfunction

function! Fzf_git_dev()
  let l:fzf_files_options = '--preview-window right:70% --ansi --preview "sh -c \"(git diff --color=always -- {3..} | sed 1,4d;'
        \ .' env COLORTERM=truecolor bat --color always --style numbers {3..}) | head -'.&lines.'\""'

  function! s:edit_devicon_prepended_file_diff(item)
    let l:file_path = a:item[7:-1]
    let l:first_diff_line_number = system("git diff -U0 ".l:file_path." | rg '^@@.*\+' -o | rg '[0-9]+' -o | head -1")
    execute 'silent e' l:file_path
    execute l:first_diff_line_number
  endfunction

  call fzf#run(fzf#wrap({
        \ 'source': 'git -c color.status=always status --short --untracked-files=all | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file_diff'),
        \ 'window': 'call FloatingFZF()',
        \ 'options': '-m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up ' . l:fzf_files_options,
        \ }))
endfunction
