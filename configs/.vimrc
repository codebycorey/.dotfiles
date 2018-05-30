"  ---------------------------
"  VimRC Configuration
"
"  Underconstruction
"
"  ---------------------------
"  General Settings
"  ---------------------------

" Reset options when resourcing .vimrc
set nocompatible

" Determine type of file with auto-indenting
filetype indent plugin on

" Enables syntax highlighting
syntax on
colorscheme molokai
"  ----------------------------
"  Usability
"  ----------------------------

" Use case insensitive search
set ignorecase
" Capital Letter sensitive search
set smartcase

" Confirm if unsaved changes before q
set confirm

" Display cursor position
set ruler

" Auto indent on new line
set autoindent

" Use visual allert when doing something wrong
set visualbell

" Set command window to height of 2
set cmdheight=2

" Display line numbers
set number

"  ----------------------------
"  Indentation settigns
"  ----------------------------

" Sets indentations to 4 spaces
set shiftwidth=4
" Sets indentations to 4 spaces
set softtabstop=4
" Sets indentation to spaces instead of tabs
set expandtab
