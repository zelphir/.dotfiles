"colorschemes
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'tpope/vim-commentary' " Comment and uncomment (gc*)
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter' " Show git changes (]c/[c to jump between).
Plug 'Chiel92/vim-autoformat'
Plug 'ryanoasis/vim-devicons'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'hsanson/vim-resize'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim'
Plug 'terryma/vim-multiple-cursors' " Sublime-like multiple cursors (C-n).
Plug 'rking/ag.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/unite.vim'
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-eunuch' " Unix command helpers (e.g. SudoWrite).
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'myusuf3/numbers.vim'
Plug 'mhinz/vim-startify' " Start screen and improved session management.
Plug 'AndrewRadev/splitjoin.vim' " Transition between single and multiline code (gS and gJ).
Plug 'djoshea/vim-autoread' "Check for file  changes outside vim
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace.
Plug 'vim-scripts/vim-auto-save'

" language-specific plugins
Plug 'alvan/vim-closetag', {'for': ['html', 'javascript', 'javascript.jsx']}
Plug 'carlitux/deoplete-ternjs'
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xml', 'javascript', 'javascript.jsx'] } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] } " JavaScript support
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] } " node support
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] } " JSX support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'digitaltoad/vim-jade', { 'for': 'jade' } " jade support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': 'stylus' } " stylus support
Plug 'lilydjwg/colorizer', { 'for': ['css', 'stylus', 'css', 'javascript', 'javascript.jsx'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'kballard/vim-fish' " fish shell support
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
