" ========================================================================
" VANILLA SETTINGS
" ========================================================================

" Enable Syntax Highlighting
syntax enable

" Color Scheme
set background=dark
colorscheme tomorrow-night
"colorscheme gruvbox
"colorscheme dracula

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
hi CursorLine term=bold cterm=bold guibg=Grey40

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

" Use OSX clipboard
set clipboard=unnamed

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
command! Q q
command! QA qall
command! E e
command! W w
command! Wq wq

