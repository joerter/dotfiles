noremap <SPACE> <Nop>
let mapleader=" "

" true color
set termguicolors

" set encoding
set encoding=UTF-8

" no swap files
set noswapfile

" always show the status line
set laststatus=2

" display column and line indicator
set cursorcolumn
set cursorline

" Line Numbers
set rnu
set nu

" syntax highlighting
syntax on

" Set line numbers and relative line numbers
set number
set relativenumber
set numberwidth=1

" Set 7 lines to the cursor when moving vertically with j/k
set so=7

" Wrapping - No wrap, scroll one char at a time
set nowrap
set sidescroll=1
set listchars+=precedes:<,extends:>

" Indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Filetype detection
filetype on
filetype plugin on
filetype indent on

" Parentheses
set showmatch

" Folding
set foldmethod=syntax
set foldcolumn=0
let javaScript_fold=1
set foldlevelstart=99

" Searching
set wrapscan
set hlsearch
set incsearch


" Turn on the Wild menu
set wildmenu

" ignore for fuzzy find
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*\\tmp\\*,*.swp,*.zip,*.exe,*\\bin\\*,*\\packages\\*,*\\obj\\*,*/node_modules/*

" add recursive folder searching to find
set path+=**

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
