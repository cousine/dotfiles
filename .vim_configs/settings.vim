" ========================================================================
" VANILLA SETTINGS
" ========================================================================

" Enable Syntax Highlighting
syntax on
" Color Scheme
"colorscheme tomorrow-night
"colorscheme gruvbox
"colorscheme dracula
let g:one_allow_italics = 1
colorscheme one
set background=dark

" Adjust status line
set laststatus=2
set noshowmode

" Spacing
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab

" Layout
set nowrap
set number
set showmatch
set ruler
set scrolloff=3

" Set relative number by default
set relativenumber

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" UI
set history=1000
set undolevels=1000
set visualbell
set noerrorbells

" MISC
set showmode
set showcmd
set encoding=utf-8
set arabicshape
set backspace=indent,eol,start
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h12
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set virtualedit=onemore

" Cursor line
set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey10

set undofile
set wildmenu
set wildmode=list:longest
set hidden

" Code Folding
set foldmethod=indent
set foldlevelstart=99
set nofoldenable

" Hide mouse while typeing
set mousehide

" Split window below
set splitbelow
set splitright

" Use xclipboard
set clipboard=unnamedplus

" Remove esc delay
set ttimeout
set ttimeoutlen=1

" Less waiting for keypress
set timeoutlen=500

" Per project vim settings
set exrc
set secure

" Undo dir
set undodir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.backup//

" Line length
set colorcolumn=81
let s:color_column_old = 0

" Show invisibles by default
set list
set listchars=tab:▸\ ,eol:¬,space:\.

" map capital counterparts of commands
command! Q qall
command! QA qall
command! E e
command! W w
command! Wq wq

" Add custom snippets folder to runtimepath
set rtp+=~/.vim_configs/UltiSnips/

" Session stuff
set sessionoptions=blank,curdir,folds,help,tabpages,winpos,buffers

" Auto reload files
"set autoread
"autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
"

" Highlight merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
