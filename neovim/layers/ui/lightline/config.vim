" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" let g:lightline#bufferline#show_number  = 2
" let g:lightline#bufferline#enable_devicons = 1
" let g:lightline#bufferline#unicode_symbols = 1
" let g:lightline#bufferline#modified = ' '
" let g:lightline#bufferline#read_only = ' '

" nmap <Leader>1 <Plug>lightline#bufferline#go(1)
" nmap <Leader>2 <Plug>lightline#bufferline#go(2)
" nmap <Leader>3 <Plug>lightline#bufferline#go(3)
" nmap <Leader>4 <Plug>lightline#bufferline#go(4)
" nmap <Leader>5 <Plug>lightline#bufferline#go(5)
" nmap <Leader>6 <Plug>lightline#bufferline#go(6)
" nmap <Leader>7 <Plug>lightline#bufferline#go(7)
" nmap <Leader>8 <Plug>lightline#bufferline#go(8)
" nmap <Leader>9 <Plug>lightline#bufferline#go(9)
" nmap <Leader>0 <Plug>lightline#bufferline#go(10)

function! s:attr(group, attr, ...) abort
  call assert_inrange(0, 1, a:0)
  if a:0 > 0
    let a = synIDattr(synIDtrans(hlID(a:group)), a:attr, a:1)
  else
    let a = synIDattr(synIDtrans(hlID(a:group)), a:attr)
  endif
  return empty(a) || a ==# '-1' ? 'NONE' :  a
endfunction

function! LightlineGitStatus() abort
  let symbols = ['+', '-', '~']
  let [added, modified, removed] = sy#repo#get_stats()
  let stats = [added, removed, modified] " reorder
  let hunkline = ''

  for i in range(3)
    if stats[i] > 0
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endif
  endfor

  if !empty(hunkline)
    let hunkline = printf('%s', hunkline[:-2])
  endif

  return hunkline
endfunction

let g:lightline = {
      \ 'colorscheme': 'oceanicnext',
      \ 'enable': { 'tabline': 0 },
      \ }
" let g:lightline.active = {
"       \ 'left' : [
"       \   ['mode', 'paste'],
"       \   ['fugitive', 'gitstatus'],
"       \   ['coc_error', 'coc_warning', 'coc_info', 'coc_hint', 'coc_fix'],
"       \   ['filepath', 'filename_active', 'current_tag']
"       \ ],
"       \ 'right': [
"       \   ['lineinfo'],
"       \   ['filetype'],
"       \   ['fileinfo']
"       \ ]
"       \ }
" let g:lightline.inactive = {
"       \ 'left' : [['filepath', 'filename_inactive']],
"       \ 'right': [['lineinfo'], ['filetype'], ['fileinfo']]
"       \ }
" let g:lightline.component_function = {
"       \ 'fugitive'         : 'LightlineFugitive',
"       \ 'gitstatus'        : 'LightlineGitStatus',
"       \ 'filepath'         : 'LightlineFilepath',
"       \ 'filename_active'  : 'LightlineFilenameActive',
"       \ 'filename_inactive': 'LightlineFilenameInactive',
"       \ 'current_tag'      : 'LightlineCurrentTag',
"       \ 'lineinfo'         : 'LightlineLineinfo',
"       \ 'fileinfo'         : 'LightlineFileinfo'
"       \ }
" let g:lightline.component_expand = {
"       \ 'buffers': 'lightline#bufferline#buffers',
"       \ 'coc_error'        : 'LightlineCocErrors',
"       \ 'coc_warning'      : 'LightlineCocWarnings',
"       \ 'coc_info'         : 'LightlineCocInfos',
"       \ 'coc_hint'         : 'LightlineCocHints',
"       \ 'coc_fix'          : 'LightlineCocFixes',
"       \ 'filetype'         : 'LightlineFiletype'
"       \ }
" let g:lightline.component_type = {
"       \ 'buffers'          : 'tabsel',
"       \ 'coc_error'        : 'error',
"       \ 'coc_warning'      : 'warning',
"       \ 'coc_info'         : 'tabsel',
"       \ 'coc_hint'         : 'middle',
"       \ 'coc_fix'          : 'middle',
"       \ 'filetype'         : 'tabsel'
"       \ }
" let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '', 'right': ''}

function! LightlineMode() abort
  return s:lightline_is_lean() || s:lightline_is_plain() ? toupper(&filetype) : lightline#mode()
endfunction

function! LightlineFugitive() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || !exists('*fugitive#head')
    return ''
  endif
  try
    let b = fugitive#head()
  catch
    return ''
  endtry
  return b !=# '' ? '' . (winwidth(0) < 80 ? '' : ' ' . b) : ''
endfunction

function! LightlineFilepath() abort
  if s:lightline_is_lean()
    return ''
  endif
  if &filetype ==? 'denite'
    return get(get(b:, 'denite_context', {}), 'sorters', '')
  endif
  if s:lightline_is_plain() || winwidth(0) < 80
    return s:lightline_readonly()
  endif
  if exists('+shellslash')
    let saved_shellslash = &shellslash
    set shellslash
  endif
  let path_string = substitute(expand('%:h'), fnamemodify(expand('~'),''), '~', '')
  if !empty(path_string) && winwidth(0) / len(path_string) < 5
    let path_string = substitute(path_string, '\v([^/])[^/]*%(/@=|$)', '\1', 'g')
  endif
  if exists('+shellslash')
    let &shellslash = saved_shellslash
  endif
  let ro = s:lightline_readonly()
  return empty(ro) ? path_string :  ro . ' ' . path_string
endfunction

function! LightlineFilenameActive() abort
  if s:lightline_is_lean()
    return ''
  endif
  if &buftype ==? 'terminal'
    return has('nvim') ? b:term_title . ' (' . b:terminal_job_pid . ')' : ''
  endif
  if &filetype ==? 'denite'
    return denite#get_status_sources()
  endif
  if &filetype ==? 'tagbar'
    return get(g:lightline, 'fname', '')
  endif
  if empty(expand('%:t'))
    return ' *'
  endif

  let mo = s:lightline_modified()
  return empty(mo) ? expand('%:t') : expand('%:t') . ' ' . mo
endfunction

function! LightlineFilenameInactive() abort
  return s:lightline_is_lean() ? '留' . toupper(&filetype) : LightlineFilenameActive()
endfunction

function! LightlineCurrentTag() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || winwidth(0) < 80
    return ''
  endif
  if !get(s:, 'currenttag_init')
    try
      let tmp = tagbar#currenttag('%', '', '')
    catch
    endtry
    unlet! tmp
    let s:currenttag_init = 1
  endif
  if !exists('*tagbar#currenttag')
    return ''
  endif
  let now = localtime()
  if get(s:, 'currenttag_last_lookup') != now
    let s:currenttag_last_lookup = now
    let s:currenttag_last_seen = tagbar#currenttag('%s', '')
  endif
  let tag = get(s:, 'currenttag_last_seen', '')
  let limit = float2nr(0.15 * winwidth(0))
  return len(tag) > limit ? tag[0:limit] . '…' : tag
endfunction

function! LightlineLineinfo() abort
  return &filetype ==? 'help'             ? ''  :
        \      &filetype ==? 'vim-plug'         ? '⚉ ' :
        \      &filetype ==? 'defx'             ? '🖿 ' :
        \      &filetype ==? 'denite'           ? ' ' :
        \      &filetype ==? 'tagbar'           ? ' ' :
        \      &filetype =~? '\v^mundo(diff)?$' ? '⮌ ' :
        \      s:lightline_is_lean() || s:lightline_is_plain() ? ' '  :
        \      printf('%d:%d ☰ %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction

function! LightlineFileinfo() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || winwidth(0) < 80
    return ''
  endif
  return printf('%s[%s]',
        \      empty(&fileencoding) ? &encoding : &fileencoding,
        \      &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : ''))
endfunction

function! LightlineFiletype() abort
  if empty(&filetype) || s:lightline_is_lean() || s:lightline_is_plain()
    return ''
  endif
  return &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '')
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction

function! LightlineCocFixes() abort
  let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
  return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction

function! s:lightline_is_lean() abort
  return &filetype =~? '\v^vim-plug|defx|mundo(diff)?$'
endfunction

function! s:lightline_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|tagbar$'
endfunction

function! s:lightline_modified() abort
  return s:lightline_is_lean() || s:lightline_is_plain() ?  ''  :
        \      &modified                                       ?  '' :
        \      &modifiable                                     ?  ''  : '-'
endfunction

function! s:lightline_readonly() abort
  return (s:lightline_is_lean() || s:lightline_is_plain()) && &filetype !=? 'help' ? '' : &readonly ? '' : ''
endfunction

function! s:lightline_patch_palette(colorscheme) abort
  try
    let palette = g:lightline#colorscheme#{a:colorscheme}#palette

    call add(palette.normal.left[0], 'bold')
    call add(palette.insert.left[0], 'bold')
    call add(palette.visual.left[0], 'bold')
    call add(palette.replace.left[0], 'bold')
  catch
  endtry
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
  if !get(g:, 'coc_enabled', 0)
    return ''
  endif
  let c = get(b:, 'coc_diagnostic_info', 0)
  if empty(c) || get(c, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic']['errorSign']
  catch
    let s = '!'
  endtry
  return printf('%d %s', c[a:kind], s)
endfunction

function! LightlineTagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
let g:tagbar_status_func = 'LightlineTagbarStatusFunc'

