" ---------------------------------------------------
" Color Schemes {{{
" ---------------------------------------------------
Plug 'morhetz/gruvbox'
"}}}

" ---------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Snippet support (C-j)
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'
"}}}

" ---------------------------------------------------
" Fuzzy search {{{
" ---------------------------------------------------

" Unite files, buffers, etc. sources
Plug 'Shougo/unite.vim'
" Outline source
Plug 'Shougo/unite-outline'
" History/yank source
Plug 'Shougo/neoyank.vim'
" Tag source
Plug 'tsukkee/unite-tag'
" Ag wrapper (Unite grep alternative) search and edit
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'

" ---------------------------------------------------
" JS (ES6, React) {{{
" ---------------------------------------------------

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" JSX syntax
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" Typescript syntax
" Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
" Autocomplete (npm install -g tern)
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Autocomplete using flow (npm install -g flow-bin)
Plug 'steelsojka/deoplete-flow'
" JavaScript Parameter Complete
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" JS Documentation comments
Plug 'heavenshell/vim-jsdoc', { 'on': ['JsDoc'] }
" Check linters path
Plug 'jaawerth/nrun.vim'
"}}}

" ---------------------------------------------------
" HTML/CSS {{{
" ---------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['vim', 'css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }
" Emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'mattn/emmet-vim', { 'for': 'html' }
"}}}

" ---------------------------------------------------
" Other languages {{{
" ---------------------------------------------------

" fish shell support
Plug 'kballard/vim-fish'
" .editorconfig support
Plug 'editorconfig/editorconfig-vim'
" Elm support
Plug 'ElmCast/elm-vim'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'
"}}}

" ---------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------

" Indentation lines
Plug 'Yggdroot/indentLine'
" fancy statusline
Plug 'vim-airline/vim-airline'
" themes for vim-airline
Plug 'vim-airline/vim-airline-themes'
" Sublime-like multiple cursors (C-n).
Plug 'terryma/vim-multiple-cursors'
" Resize panes
Plug 'hsanson/vim-resize'
" Highlight trailing whitespace.
Plug 'ntpeters/vim-better-whitespace'
"}}}

" ---------------------------------------------------
" External tools integration plugins {{{
" ---------------------------------------------------

" Fugitive
Plug 'tpope/vim-fugitive'
" Git log viewer (Gitv! for file mode)
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" Color picker
Plug 'KabbAmine/vCoolor.vim', { 'on': ['VCoolor', 'VCase'] }
"}}}

" ---------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Safely editing in isolation
" Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
" Cycling related words via C-a C-x (i.e. true/false)
Plug 'zef/vim-cycle'
" Titlecase motion (gt)
Plug 'christoomey/vim-titlecase'
"}}}

" ---------------------------------------------------
" Other {{{
" ---------------------------------------------------
" Start screen and improved session management.
Plug 'mhinz/vim-startify'
" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Search for highlighted word with *
Plug 'thinca/vim-visualstar'
" Improve star by not jumping immediately
Plug 'ironhouzi/vim-stim'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Iabbrev auto-correction library
Plug 'chip/vim-fat-finger'
" Matchit enhances jump motions
Plug 'edsono/vim-matchit'
" More . repeat functionality
Plug 'tpope/vim-repeat'
" Delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
" Populate arglist with buffers in quickfix list
Plug 'nelstrom/vim-qargs', { 'on': 'Qargs' }
" Asks if you wanted to open existing file
Plug 'EinfachToll/DidYouMean'
" Codi interactive REPL like editing
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
" Time tracker
Plug 'wakatime/vim-wakatime'
"Check for file  changes outside vim
Plug 'djoshea/vim-autoread'
" Search with silver-searcher
Plug 'rking/ag.vim'
" Integration with tmux
Plug 'christoomey/vim-tmux-navigator'
" Create dir
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'pbrisbin/vim-mkdir'
" Unix command helpers (e.g. SudoWrite).
Plug 'tpope/vim-eunuch'
" Sensible defaults
Plug 'tpope/vim-sensible'
"}}}

" Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
" Plug 'sickill/vim-pasta' " context-aware pasting
" Plug 'ryanoasis/vim-devicons'
