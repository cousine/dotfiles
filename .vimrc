if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/cousine/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/cousine/.vim/bundle')
  call dein#begin('/Users/cousine/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/cousine/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " Git
  call dein#add('tpope/vim-fugitive')
  " Rails
  call dein#add('tpope/vim-rails.git', { 'on_ft': ["rb", "erb"] })
  " Ruby
  call dein#add('vim-ruby/vim-ruby', { 'on_ft': ["rb"] }) 
  " Rubocop
  call dein#add('ngmy/vim-rubocop', { 'on_ft': ["rb"] }) 
  " Tomorrow Theme
  call dein#add('chriskempson/tomorrow-theme', {'rtp': 'vim/'}) 
  " NerdTree
  call dein#add('scrooloose/nerdtree') 
  " Git indicator for NerdTree
  call dein#add('Xuyuanp/nerdtree-git-plugin') 
  " Comments helper
  call dein#add('scrooloose/nerdcommenter') 
  " Git indicator
  call dein#add('airblade/vim-gitgutter') 
  " Auto close parentheses, quotes, ... etc
  call dein#add('jiangmiao/auto-pairs') 
  " Highlight brackets around the cursor
  call dein#add('kid-icarus/vim-blockify') 
  " Movement in HTML
  call dein#add('gcmt/breeze.vim') 
  " Compatibility with tmux and iterm2
  call dein#add('sjl/vitality.vim') 
  " Move lines around
  call dein#add('matze/vim-move') 
  " Close buffers and stuff
  call dein#add('moll/vim-bbye') 
  " Startup easy access menu
  call dein#add('mhinz/vim-startify') 
  " Cycle themes
  call dein#add('vim-scripts/CycleColor') 
  " CoffeeScript
  call dein#add('kchmck/vim-coffee-script') 
  " Lorem Ipsum
  call dein#add('vim-scripts/loremipsum') 
  " Fuzzy find in files
  "call dein#add('ctrlpvim/ctrlp.vim') 
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " Swap windows
  call dein#add('wesQ3/vim-windowswap') 
  " Auto indent lines
  call dein#add('Yggdroot/indentLine') 
  " Go
  call dein#add('fatih/vim-go') 
  " Undo history navigation
  call dein#add('simnalamburt/vim-mundo') 
  " Show tags in a file (,t)
  call dein#add('majutsushi/tagbar') 
  call dein#add('lvht/tagbar-markdown')
  " Some ColorSchemes
  call dein#add('flazz/vim-colorschemes') 
  " Airline bar
  call dein#add('bling/vim-airline') 
  " Insert auto completion
  call dein#add('ervandew/supertab') 
  " Color selector in css
  call dein#add('ap/vim-css-color') 
  " Retro color scheme
  call dein#add('morhetz/gruvbox') 
   "Autoformat different languages
  "call dein#add('Chiel92/vim-autoformat') 
  " Preview Markdown
  call dein#add('nelstrom/vim-markdown-preview') 
  " Improve HTML/CSS workflow
  call dein#add('mattn/emmet-vim') 
  " Integration with tmux
  call dein#add('benmills/vimux') 
  " Align text easily
  call dein#add('godlygeek/tabular')
  " Markdown stuff
  call dein#add('chemzqm/macdown.vim')
  call dein#add('Shougo/vimproc.vim')
  " Github Completion
  call dein#add('rhysd/github-complete.vim')
  " Add filetype glyphs
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  " Highlight characters on f,F,t,T
  call dein#add('unblevable/quick-scope')
  " Interactive shell in vim
  call dein#add('metakirby5/codi.vim')
  " cycle through cursor positions
  call dein#add('fergdev/vim-cursor-hist')
  " Dracula color scheme
  call dein#add('cousine/vim')
  " Buffer timer for time keeping
  call dein#add('chrisbra/buftimer')
  " IRSSI
  call dein#add('isundil/vim-irssi-syntax')
  " Snippets!!!!
  call dein#add('sirver/ultisnips')
  call dein#add('honza/vim-snippets')
  " Auto-Complete!
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('Shougo/echodoc.vim')
  " vim-scripts repos
  call dein#add('vim-scripts/L9')
  call dein#add('vim-scripts/surround.vim')
  " Smooth scrolling
  call dein#add('yuttie/comfortable-motion.vim')

  " Dockerfile syntax
  call dein#add('ekalinin/Dockerfile.vim')

  " CSS
  "call dein#add('JulesWang/css.vim')
  " HAML & SASS syntax
  call dein#add('tpope/vim-haml')
  " CSS3 syntax
  call dein#add('hail2u/vim-css3-syntax')
  " SCSS syntax
  call dein#add('cousine/scss-syntax.vim', {'name': 'scss'})


  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell')

  " Vim and Tmux play nicely! (run in tmux pane)
  call dein#add('cousine/vim-tmux-runner')

  " Marks
  call dein#add('kshenoy/vim-signature')

  " React
  call dein#add('pangloss/vim-javascript')
  call dein#add('MaxMEllon/vim-jsx-pretty')

  " Trace syntax highlight
  call dein#add('gerw/vim-HiLinkTrace')

  " Cheatsheets
  call dein#add('wsdjeg/vim-cheat')

  " Markdown TOC
  call dein#add('wikimatze/tocdown')

  " Parentheses color multiplexer
  call dein#add('luochen1990/rainbow') 

  " API Blueprint Syntax
  call dein#add('kylef/apiblueprint.vim')

  " FUN
  call dein#add('koron/nyancat-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Fix comments italics
let g:gruvbox_italic=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

filetype plugin indent on     " required!

syntax enable
set background=dark
colorscheme tomorrow-night
"colorscheme gruvbox
"colorscheme dracula

set laststatus=2
set noshowmode

" My stuff

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

" Change <leader> key
let mapleader = ","

" Fix keycodes for Ctrl + Arrows
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>

" Auto reload .vimrc on save
"augroup reload_vimrc " {
  "autocmd!
  "autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Split panes
nnoremap <silent> <C-\> <C-w>v<C-w>left
nnoremap <silent> <C-_> :split<cr>
nnoremap <silent> <C-x> <C-w>q
nnoremap <silent> <leader>= <C-w>=
nnoremap <silent> <leader>j :resize -5<cr>
nnoremap <silent> <leader>k :resize +5<cr>
nnoremap <silent> <leader>h :vertical resize +5<cr>
nnoremap <silent> <leader>l :vertical resize -5<cr>

" Navigation
nnoremap <silent> <C-left> :wincmd h<cr>
nnoremap <silent> <C-down> :wincmd j<cr>
nnoremap <silent> <C-up> :wincmd k<cr>
nnoremap <silent> <C-right> :wincmd l<cr>

" Rainbow Parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1

" GitGutter
au VimEnter * GitGutterEnable

" Tab Navigation
nnoremap <silent> <leader>] :bn<cr>
nnoremap <silent> <leader>[ :bp<cr>

" Line Move
let g:move_key_modifier = 'C'

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Delete into a blackhole
noremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"

" Per project vim settings
set exrc
set secure

" Split quit & search clear
nnoremap <leader>q :Bdelete<CR>
nmap <SPACE> <SPACE>:noh<CR>

" Save on double <Esc>
map <Esc><Esc> :w<CR>

" Undo dir
set undodir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.backup//

" Mundo
nnoremap <leader>u :MundoToggle<CR>
let g:mundo_prefer_python3 = 1

" Wrap
nnoremap <leader>w :set wrap linebreak nolist <bar> :set colorcolumn=80<CR>
nnoremap <leader>W :set nowrap <bar> :set colorcolumn=0<CR>

" Line length
set colorcolumn=81
let s:color_column_old = 0

" Show invisibles by default
set list

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction

nnoremap <leader>c :call <SID>ToggleColorColumn()<CR>

" Git Gutter max signs
let g:gitgutter_max_signs=1000000

" Sessions & Startify
let g:startify_custom_header = [
      \ '      ___    ___   __  __    ____/\_\    ___      __   ',
      \ '     / ___\ / __`\/\ \/\ \  / ,__\/\ \ /  _ `\  / __`\ ',
      \ '    /\ \__//\ \L\ \ \ \_\ \/\__, `\ \ \/\ \/\ \/\  __/ ',
      \ '    \ \____\ \____/\ \____/\/\____/\ \_\ \_\ \_\ \____\',
      \ '     \/____/\/___/  \/___/  \/___/  \/_/\/_/\/_/\/____/',
      \ '',
      \ '',
      \ ]
let g:startify_list_order = [
      \ ['Saved sessions:'], 'sessions',
      \ ['Most used files in the current directory:'], 'dir',
      \ ['Most recently used files'], 'files',
      \ ['Bookmarks'], 'bookmarks',
      \ ]

" Sessions Specific
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1

let g:startify_session_savevars = [
      \ 'NERDTreeIgnore',
      \ 'g:ctrlp_user_command',
      \ ]
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeClose'
        \ ]

highlight StartifyBracket ctermfg=38
highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=148 cterm=bold
highlight StartifyNumber  ctermfg=38 cterm=bold
highlight StartifyFile    ctermfg=1
highlight StartifyPath    ctermfg=15
highlight StartifySlash   ctermfg=240
highlight StartifySpecial ctermfg=148
highlight StartifySection ctermbg=148 ctermfg=22 cterm=bold

" Automatically delete trailing whitespaces

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction 
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

autocmd FileType ruby autocmd BufWritePre <buffer> :call Preserve("%s/\\s\\+$//e")

" Automatically reformat
"au BufWrite *.rb :Autoformat

" Tagbar
nmap <leader>t :TagbarToggle<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "goimports"

" Find in nerdtree
nmap ,f :NERDTreeFind<CR>

" markdown preview
let g:macdown_marked_programme = 'misaka'

" Align text easily
vnoremap <leader>t :Tab /

" {{{ Zoom / Restore window

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

" Show quick move highlights on f, F, t, T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Cycle through cursor locations
nnoremap <leader>` :call g:CursorHistForward()<CR>
nnoremap <leader>' :call g:CursorHistBack()<CR>

" Enable deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
set noshowmode
" Snips and completion fix
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsListSnippets="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Highlight code blocks in markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'shell=sh', 'irb=ruby']

" FuzzyFinder fzf
let g:fzf_layout = { 'window': '10 split | enew' }
nnoremap <C-p> :FZF<CR>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
nnoremap <C-t> :Buffers<CR> 

" Vim Go
set rtp +=$GOPATH/src/github.com/golang/lint/misc/vim
" GoLint
autocmd FileType go nmap <C-b>  <Plug>(go-build)
autocmd FileType go nmap <C-i>  <Plug>(go-imports)
autocmd FileType go nmap <C-l> :Lint<CR>:cwindow<CR>

" Close nerdtree when opening a file
let NERDTreeQuitOnOpen=1

" Close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! SaveSession()
  if !filereadable('Session.vim')
    let session_name = fnamemodify(getcwd(), ':t')
    mksession Session.vim
    silent! execute 'SSave ' . session_name
    echon 'Session saved as ' . session_name 
  else
    echon 'Session already exists'
  endif
endfunction

nnoremap <leader>s :call SaveSession()<CR>

autocmd FileType markdown noremap <buffer> <leader>v :Preview<CR>

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
  \   'scss': 0,
	\	}
	\}

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,space:\.

" Tabs!!
map <leader>T :tabe %<CR>
map <leader>W :tabclose<CR>

command! Q q
command! QA qall
command! E e
command! W w
command! Wq wq

nmap k gk
nmap j gj
