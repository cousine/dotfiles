" ========================================================================
" PLUGINS SETTINGS
" ========================================================================

" Airline fonts
let g:airline_theme='material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Fix comments italics
let g:gruvbox_italic=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Rainbow Parentheses
let g:rainbow_active = 1
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

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
" Close nerdtree when opening a file
let NERDTreeQuitOnOpen=1
" Close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Change CWD whenver NERDTree changes dir
let NERDTreeChDirMode=2
" Ignore files and folders in the tree
let NERDTreeIgnore = ['\.git$', '\node_modules$', '_build$']

" GitGutter
au VimEnter * GitGutterEnable
" Git Gutter max signs
let g:gitgutter_max_signs=1000000

" Mundo
let g:mundo_prefer_python3 = 1

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
      \ 'g:fzf_def_command',
      \ ]
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeClose'
        \ ]

highlight StartifyBracket ctermfg=38 guifg=#56b6c2
highlight StartifyFooter  ctermfg=240 guifg=#585858
highlight StartifyHeader  ctermfg=148 cterm=bold guifg=#98c379 gui=bold
highlight StartifyNumber  ctermfg=38 cterm=bold guifg=#56b6c2 gui=bold
highlight StartifyFile    ctermfg=1 guifg=#e06c75
highlight StartifyPath    ctermfg=15 guifg=#FFFFFF
highlight StartifySlash   ctermfg=240 guifg=#585858
highlight StartifySpecial ctermfg=148 guifg=#98c379
highlight StartifySection ctermbg=148 ctermfg=22 cterm=bold guibg=#98c379 guifg=#005f00 gui=bold

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Vim Go
set rtp +=$GOPATH/src/github.com/golang/lint/misc/vim
" GoLint
autocmd FileType go nmap <C-b>  <Plug>(go-build)
autocmd FileType go nmap <C-i>  <Plug>(go-imports)
autocmd FileType go nmap <C-l> :Lint<CR>:cwindow<CR>


" markdown preview
let g:macdown_marked_programme = 'misaka'
" Highlight code blocks in markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'shell=sh', 'irb=ruby']


" Enable deoplete
let g:deoplete#enable_at_startup = 1
"set completeopt-=preview
set completeopt=longest,menuone
set noshowmode

au VimEnter * call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

" Supertab fix backward tab
let g:SuperTabDefaultCompletionType = "<c-n>"

" FuzzyFinder fzf
let g:fzf_layout = { 'window': '10 split | enew' }
let g:fzf_def_command = 'rg --files --no-ignore --hidden --follow '
call SetRgIgnore(["!.git/*"])
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow '.join(rg_ignore, ' ').' --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Show quick move highlights on f, F, t, T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" TaskWarrior
" default fields to ask when adding a new task
let g:task_default_prompt  = ['project', 'description', 'priority', 'due']

" Set UltiSnippets directory for :UltiSnipsEdit
let g:UltiSnipsSnippetsDir="~/.vim_configs/UltiSnips"
" Could be problamatic for SnipMate?
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim_configs/UltiSnips']

" Disable JSON conceal (hiding double quotes)
let g:indentLine_concealcursor=""
let g:vim_json_syntax_conceal = 0 

" Vimade fade
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.detecttermcolors = 1
let g:vimade.fadepriority = 0

" Vuejs
let g:vim_vue_plugin_use_sass = 1

" TrueZen
lua << EOF
local true_zen = require("true-zen")

true_zen.setup({
ui = {
  left = {
			number = false,
			relativenumber = true,
			signcolumn = "no",
    }
  }
})
EOF

" Bufferline
lua << EOF
require("bufferline").setup{
  options = {
    numbers = "buffer_id",
    separator_style = "slant",
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    offsets = {
      {filetype = "nerdtree", text = " NERDTree", highlight = "Directory", text_align = "center"},
      {filetype = "Mundo", text = "社Mundo", highlight = "Directory", text_align = "center"}
    },
    custom_areas = {
      right = function()
        local result = {}
        local error = vim.diagnostic.get(0, [[Error]])
        local warning = vim.diagnostic.get(0, [[Warning]])
        local info = vim.diagnostic.get(0, [[Information]])
        local hint = vim.diagnostic.get(0, [[Hint]])

        if error ~= 0 then
          table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
        end

        if warning ~= 0 then
          table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
        end

        if hint ~= 0 then
          table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
        end

        if info ~= 0 then
          table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
        end
        return result
      end,
    }
  }
}
EOF

" LSP
lua << EOF
require'lspconfig'.gopls.setup{}
EOF
