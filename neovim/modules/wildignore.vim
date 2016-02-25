" tab completion for file selection
set wildmode=longest:full,full

" make tab completion for files/buffers act like bash
set wildmenu

set wildignore+=.hg,.git,.svn                                     " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg                    " binary images
set wildignore+=*.sw?                                             " Vim swap files
set wildignore+=.DS_Store                                         " OSX

set wildignore+=*.obj,*.rbc,*.class,*.gem                         " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz           " Disable archive files

" Ignore bundler and sass cache
set wildignore+=*/tmp/*
set wildignore+=*/coverage/*
set wildignore+=*.otf,*.woff,*.orig

" Ignore middleman build
set wildignore+=build

" Ignore middleman build
set wildignore+=node_modules
