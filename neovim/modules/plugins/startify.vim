autocmd User Startified setlocal buftype=
autocmd User Startified setlocal cursorline

let g:startify_change_to_vcs_root     = 1
let g:startify_enable_special         = 0
let g:startify_files_number           = 6
let g:startify_relative_path          = 1
"let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
                  \ ['   LRU within this dir:'],
                  \ 'dir',
                  \ ['   LRU:'],
                  \ 'files',
                  \ ['   Sessions:'],
                  \ 'sessions',
                  \ ['   Bookmarks:'],
                  \ 'bookmarks',
                  \ ]

let g:startify_bookmarks = [
                  \ { 'd': '~/.dotfiles' },
                  \ ]

let g:startify_custom_header =
                  \ map(split(system('fortune -s computers | cowsay -f `ls /usr/local/Cellar/cowsay/3.03/share/cows/ | shuf -n 1`'), '\n'), '"   ". v:val') + ['']
