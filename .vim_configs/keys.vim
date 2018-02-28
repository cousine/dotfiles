" ========================================================================
" KEY MAPPINGS
" ========================================================================

" Change <leader> key
let mapleader = ","

" Fix keycodes for Ctrl + Arrows
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>

" Ctrl + N for NERDTree
map <C-n> :NERDTreeToggle<CR>
" Find in nerdtree
nmap ,f :NERDTreeFind<CR>

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
" Zoom window
nnoremap <silent> <leader>z :ZoomToggle<CR>

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

" Split quit & search clear
nnoremap <leader>q :Bdelete<CR>
nmap <SPACE> <SPACE>:noh<CR>

" Save on double <Esc>
map <Esc><Esc> :w<CR>

" Mundo
nnoremap <leader>u :MundoToggle<CR>

" Wrap
nnoremap <leader>w :set wrap linebreak nolist <bar> :set colorcolumn=80<CR>
nnoremap <leader>W :set nowrap <bar> :set colorcolumn=0<CR>

" Toggle color column
nnoremap <leader>c :call <SID>ToggleColorColumn()<CR>

" Delete trailing whitespaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" Align text easily
vnoremap <leader>t :Tab /

" Show quick move highlights on f, F, t, T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Cycle through cursor locations
nnoremap <leader>` :call g:CursorHistForward()<CR>
nnoremap <leader>' :call g:CursorHistBack()<CR>

" Snips and completion fix
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsListSnippets="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" FZF
nnoremap <C-p> :FZF<CR>
nnoremap <C-t> :Buffers<CR> 

" Sessions
nnoremap <leader>s :call SaveSession()<CR>

" Markdown preview
autocmd FileType markdown noremap <buffer> <leader>v :Preview<CR>

" Show/Hide line special characters
nmap <leader>l :set list!<CR>

" Tabs!!
map <leader>T :tabe %<CR>
map <leader>W :tabclose<CR>

" Use gk and gj instead of k & j
nmap k gk
nmap j gj
