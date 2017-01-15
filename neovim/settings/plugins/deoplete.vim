" ---
"  Deoplete
"  ---

let g:deoplete#enable_at_startup         = 1
" let g:deoplete#enable_refresh_always   = 0
" let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#omni#functions            = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview

let g:deoplete#sources                   = {}
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources._                 = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.vim               = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css               = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss              = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html              = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:tern#command                       = ['tern']
let g:tern#arguments                     = ['--persistent']

" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
" inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete backword char
" inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
