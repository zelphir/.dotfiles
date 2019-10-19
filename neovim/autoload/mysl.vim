let s:slc={}

" From oceanic-next/colors/OceanicNext.vim
let s:slc.base00 = '#1b2b34'
let s:slc.base01 = '#343d46'
let s:slc.base02 = '#4f5b66'
let s:slc.base03 = '#65737e'
let s:slc.base04 = '#a7adba'
let s:slc.base05 = '#c0c5ce'
let s:slc.base06 = '#cdd3de'
let s:slc.base07 = '#d8dee9'
let s:slc.base08 = '#ec5f67'
let s:slc.base09 = '#f99157'
let s:slc.base0A = '#fac863'
let s:slc.base0B = '#99c794'
let s:slc.base0C = '#62b3b2'
let s:slc.base0D = '#6699cc'
let s:slc.base0E = '#c594c5'
let s:slc.base0F = '#ab7967'
let s:slc.base10 = '#ffffff'

" Custom colors
let s:slc.base00d = '#18252c' " darker base00d

function! mysl#SetColors() abort
  call s:callHighlight('VimMode', 'base00', 'base0C')
  call s:callHighlight('FilePath', 'base06', 'base02')
  call s:callHighlight('FileName', 'base07', 'base01')
  call s:callHighlight('GitBranch', 'base0E', 'base00d')
  call s:callHighlight('GitStatusAdded', 'base0B', 'base00d')
  call s:callHighlight('GitStatusModified', 'base0A', 'base00d')
  call s:callHighlight('GitStatusRemoved', 'base09', 'base00d')
  call s:callHighlight('DiagnosticSymbol', 'base00', 'base09')
  call s:callHighlight('CocError', 'base08', 'base00d')
  call s:callHighlight('CocWarn', 'base0A', 'base00d')
  call s:callHighlight('CocInfo', 'base03', 'base01')
  call s:callHighlight('Encoding', 'base07', 'base02')
  call s:callHighlight('FileFormat', 'base07', 'base02')
  call s:callHighlight('LineInfo', 'base00d', 'base0C')
  call s:callHighlight('UtilsInfo', 'base0C', 'base01')
  call s:callHighlight('Reset', 'base00', 'base01')
  call s:callHighlight('DarkBgSep', 'base02', 'base00d')
endfunction

" {{{ StatusLine functions
function! mysl#VimMode() abort
  let l:mode=mode()
  let l:label = ''

  if l:mode==#'n'
    call s:callHighlight('VimMode', 'base00', 'base0C')
    let l:label = 'N'
  elseif l:mode==?'v'
    call s:callHighlight('VimMode', 'base00', 'base0A')
    let l:label = 'V'
  elseif l:mode==#'\<C-v>'
    call s:callHighlight('VimMode', 'base00', 'base09')
    let l:label = 'V-B'
  elseif l:mode==#'i'
    call s:callHighlight('VimMode', 'base07', 'base08')
    let l:label = 'I'
  elseif l:mode==#'R'
    call s:callHighlight('VimMode', 'base00', 'base0D')
    let l:label = 'R'
  elseif l:mode==#'t'
    call s:callHighlight('VimMode', 'base00', 'base07')
    let l:label = 'T'
  elseif l:mode==#'c'
    call s:callHighlight('VimMode', 'base00', 'base0E')
    let l:label = 'C'
  else
    call s:callHighlight('VimMode', 'base07',  'base01')
    let l:label = '-'
  endif

  return l:label
endfunction

function! mysl#FilePath() abort
  let l:filepath = expand('%:h')
  let path_string = substitute(l:filepath, getcwd() . '/', '', '')
  let path_string = substitute(l:filepath, fnamemodify(expand('~'), ''), '~', '')

  if mysl#ShowFilePath()
    return 'פּ ' . path_string
  endif
endfunction

function! mysl#Filename() abort
  if mysl#IsUtils()
    let l:filename = ''
  elseif mysl#IsTerminal()
    let l:filename = b:term_title . ' (' . b:terminal_job_pid . ')'
  elseif empty(expand('%:t'))
    let l:filename = ' *'
  else
    let l:filename = s:getFilenameWithIcon()
  endif

  return l:filename
endfunction

function! mysl#modifiedStatus(active) abort
  let mo = s:modified()
  if !empty(mo) && a:active
    call s:callHighlight('FileName', 'base01', 'base0A')
    return mo
  else
    call s:callHighlight('FileName', 'base07', 'base01')
    return ''
  endif
endfunction

function! mysl#GitBranch() abort
  return trim(get(g:, 'coc_git_status', ''))
endfunction

function! mysl#GitFileStatus(type) abort
  let status = get(b:, 'coc_git_status', '')
  let val = {}

  if a:type == 'added'
    let n = matchstr(b:coc_git_status, '\v\+\zs(\d)')
    let val.added = !empty(n) ? "\U02D6".n : ''
  elseif a:type == 'modified'
    let n = matchstr(b:coc_git_status, '\v\~\zs(\d)')
    let val.modified = !empty(n) ? "\U00B7".n : ''
  elseif a:type == 'removed'
    let n = matchstr(b:coc_git_status, '\v\-\zs(\d)')
    let val.removed = !empty(n) ? "\U02D7".n : ''
  endif

  return get(val, a:type, '')
endfunction

function! mysl#CocMsg(type) abort
  let symbol = get(g:, 'coc_status_' . a:type . '_sign', '')
  let info = get(b:, 'coc_diagnostic_info', {})
  let msgs = []

  if empty(info)
    return ''
  endif

  if get(info, a:type, 0)
    call add(msgs, symbol . info[a:type])
  endif

  return join(msgs, ' ')
endfunction

function! mysl#CocInfo() abort
  let status=get(g:, 'coc_status', '')
  let regstatus=substitute(status, 'TSC', 'Ⓣ ', '')
  let statusbar= split(regstatus)

  if &filetype ==? 'go'
    let gobar = 'Ⓖ '
    call add(statusbar, gobar)
  endif

  let s = join(statusbar, '  ')

  if empty(s)
    return ''
  endif

  return s
endfunction

function! mysl#FileEncoding() abort
  return &fenc !=# '' ? &fenc : &enc
endfunction

function! mysl#Fileformat() abort
  return WebDevIconsGetFileFormatSymbol()
endfunction

function! mysl#LineInfo() abort
  return printf('  %d:%d %d%%', line('.'), col('.'), 100*line('.')/line('$')). ' '
endfunction

function! mysl#UtilsInfo() abort
  return
        \ &filetype ==? 'help'             ? '  '  :
        \ &filetype ==? 'defx'             ? '   ' :
        \ &filetype ==? 'coc-explorer'     ? '   ' :
        \ &filetype ==? 'denite'           ? '   ' :
        \ &filetype ==? 'tagbar'           ? '   ' :
        \ &filetype ==? 'vista_kind'       ? '   ' :
        \ &filetype ==? 'magit'            ? '   ' :
        \ &filetype =~? '\v^mundo(diff)?$' ? '   ' :
        \ ''
endfunction
" }}}

" {{{ Utils
function! mysl#shouldShow() abort
  let totalWidth = 2 * 5 " empty spaces
  let totalWidth += len(mysl#VimMode()
        \ .mysl#Filename()
        \ .mysl#modifiedStatus(1)
        \ .mysl#CocInfo()
        \ .mysl#FileEncoding()
        \ .mysl#LineInfo()
        \ )

  if mysl#ShowFilePath()
    let totalWidth += len(mysl#FilePath()) + 2
  endif


  if !empty(get(g:,'coc_git_status', ''))
    let totalWidth += len(mysl#GitBranch()) + 2
  endif

  if !empty(get(b:,'coc_git_status', ''))
    let totalWidth += len(mysl#GitFileStatus('added')
          \ .mysl#GitFileStatus('removed')
          \ .mysl#GitFileStatus('modified')
          \ ) + 2
  endif

  if !empty(mysl#CocMsg('error'))|| !empty(mysl#CocMsg('warning'))
    if !empty(get(b:, 'coc_diagnostic_info', {}))
      let totalWidth += 3
    endif
    let totalWidth += len(mysl#CocMsg('error').mysl#CocMsg('warning')) + 2
  endif

  if winwidth(0) < (totalWidth + 1)
    return 0
  else
    return 1
  endif
endfunction

function! mysl#IsUtils() abort
  return &filetype =~? '\v^list|help|denite|defx|vista(_kind)|magit|tagbar|coc-explorer|mundo(diff)?$'
endfunction

function! mysl#IsTerminal() abort
  return &buftype ==? 'terminal'
endfunction

function! mysl#ShowFilePath() abort
  let l:filepath = expand('%:h')

  if empty(l:filepath) || l:filepath == '.'
    return 0
  endif

  return 1
endfunction

function! s:modified() abort
  return mysl#IsTerminal() ? '' :
        \ &modified   ? '' :
        \ &modifiable ? ''  : '-'
endfunction

function! s:readonly() abort
  if &filetype == 'help'
    return ''
  elseif &readonly
    return ''
  else
    return ''
  endif
endfunction

function! s:getFilenameWithIcon() abort
  let icon = (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft')
  let filename = ('' != s:readonly() ? s:readonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '')
  let ret = [filename, icon]

  if filename == ''
    return ''
  endif

  return icon . ' ' . filename
endfunction

function! s:callHighlight(group, fg, ...) abort
  " Arguments: group, guifg, guibg, gui, guisp
  let histring = 'hi ' . a:group . ' '

  if strlen(a:fg)
    if a:fg == 'fg'
      let histring .= 'guifg=fg '
    else
      let c = get(s:slc, a:fg)
      let histring .= 'guifg=' . c . ' '
    endif
  endif

  if a:0 >= 1 && strlen(a:1)
    if a:1 == 'bg'
      let histring .= 'guibg=bg '
    else
      let c = get(s:slc, a:1)
      let histring .= 'guibg=' . c . ' '
    endif
  endif

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let c = get(s:slc, a:3)
    let histring .= 'guisp=' . c . ' '
  endif

  execute histring
endfunction
" }}}
