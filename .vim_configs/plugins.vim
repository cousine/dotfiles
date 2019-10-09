" ========================================================================
" PLUGINS
" ========================================================================

packadd minpac

if !exists('*minpac#init')
  finish
endif

call minpac#init()

" Add or remove your plugins here:
" Git
call minpac#add('tpope/vim-fugitive')
" Rails
call minpac#add('tpope/vim-rails')
" Ruby
call minpac#add('vim-ruby/vim-ruby')
" Repeat last command
call minpac#add('tpope/vim-repeat')
" Rubocop
call minpac#add('ngmy/vim-rubocop') 
" Tomorrow Theme
call minpac#add('chriskempson/tomorrow-theme') 
" NerdTree
call minpac#add('scrooloose/nerdtree') 
" Git indicator for NerdTree
call minpac#add('Xuyuanp/nerdtree-git-plugin') 
" Comments helper
call minpac#add('scrooloose/nerdcommenter') 
" Git indicator
call minpac#add('airblade/vim-gitgutter') 
" Auto close parentheses, quotes, ... etc
call minpac#add('jiangmiao/auto-pairs') 
" Highlight brackets around the cursor
call minpac#add('kid-icarus/vim-blockify') 
" Movement in HTML
call minpac#add('gcmt/breeze.vim') 
" Compatibility with tmux and iterm2
call minpac#add('sjl/vitality.vim') 
" Move lines around
call minpac#add('matze/vim-move') 
" Close buffers and stuff
call minpac#add('moll/vim-bbye') 
" Startup easy access menu
call minpac#add('mhinz/vim-startify') 
" Cycle themes
call minpac#add('vim-scripts/CycleColor') 
" CoffeeScript
call minpac#add('kchmck/vim-coffee-script') 
" Lorem Ipsum
call minpac#add('vim-scripts/loremipsum') 
" Fuzzy find in files
set rtp+=/usr/local/opt/fzf
call minpac#add('junegunn/fzf.vim')
" Swap windows
call minpac#add('wesQ3/vim-windowswap') 
" Auto indent lines
call minpac#add('Yggdroot/indentLine') 
" JSON
call minpac#add('elzr/vim-json')
" Go
call minpac#add('fatih/vim-go') 
" Undo history navigation
call minpac#add('simnalamburt/vim-mundo') 
" Show tags in a file (,t)
call minpac#add('majutsushi/tagbar') 
call minpac#add('lvht/tagbar-markdown')
" Some ColorSchemes
call minpac#add('flazz/vim-colorschemes') 
" Airline bar
call minpac#add('bling/vim-airline') 
" Insert auto completion
call minpac#add('ervandew/supertab') 
" Color selector in css
call minpac#add('ap/vim-css-color') 
" Retro color scheme
call minpac#add('morhetz/gruvbox') 
" Preview Markdown
"call minpac#add('nelstrom/vim-markdown-preview') 
" Previm markdown preview
call minpac#add('previm/previm')
" Open url in browser
call minpac#add('tyru/open-browser.vim')
" Improve HTML/CSS workflow
call minpac#add('mattn/emmet-vim') 
" Integration with tmux
call minpac#add('benmills/vimux') 
" Align text easily
call minpac#add('godlygeek/tabular')
" Markdown stuff
call minpac#add('chemzqm/macdown.vim')
call minpac#add('Shougo/vimproc.vim')
" Github Completion
call minpac#add('rhysd/github-complete.vim')
" Add filetype glyphs
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
" Highlight characters on f,F,t,T
call minpac#add('unblevable/quick-scope')
" Interactive shell in vim
call minpac#add('metakirby5/codi.vim')
" cycle through cursor positions
call minpac#add('fergdev/vim-cursor-hist')
" Dracula color scheme
call minpac#add('cousine/vim')
" Buffer timer for time keeping
call minpac#add('chrisbra/buftimer')
" IRSSI
call minpac#add('isundil/vim-irssi-syntax')
" Snippets!!!!
call minpac#add('sirver/ultisnips')
call minpac#add('honza/vim-snippets')
" Auto-Complete!
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('zchee/deoplete-go')
call minpac#add('Shougo/echodoc.vim')
" vim-scripts repos
call minpac#add('vim-scripts/L9')
call minpac#add('vim-scripts/surround.vim')

" Dockerfile syntax
call minpac#add('ekalinin/Dockerfile.vim')

" HAML & SASS syntax
call minpac#add('tpope/vim-haml')
" CSS3 syntax
call minpac#add('hail2u/vim-css3-syntax')
" SCSS syntax
call minpac#add('cousine/scss-syntax.vim')

" Task Warrior Integration
call minpac#add('blindFS/vim-taskwarrior')

" Vim and Tmux play nicely! (run in tmux pane)
call minpac#add('cousine/vim-tmux-runner')

" Marks
call minpac#add('kshenoy/vim-signature')

" React
call minpac#add('pangloss/vim-javascript')
call minpac#add('MaxMEllon/vim-jsx-pretty')

" Trace syntax highlight
call minpac#add('gerw/vim-HiLinkTrace')

" Cheatsheets
call minpac#add('wsdjeg/vim-cheat')

" Markdown TOC
call minpac#add('wikimatze/tocdown')

" Parentheses color multiplexer
call minpac#add('luochen1990/rainbow') 

" API Blueprint Syntax
call minpac#add('kylef/apiblueprint.vim')

" Yank highlight
call minpac#add('machakann/vim-highlightedyank')

" Elixir programming language
call minpac#add('elixir-editors/vim-elixir')

" Onedark theme
call minpac#add('rakr/vim-one')

" Unix shel sugar
call minpac#add('tpope/vim-eunuch')

" FUN
call minpac#add('koron/nyancat-vim')

" BufOnly
call minpac#add('vim-scripts/BufOnly.vim')

" Highlight interesting words
call minpac#add('lfv89/vim-interestingwords')

" Git commit viewer
call minpac#add('junegunn/gv.vim')

" Zen Mode
call minpac#add('junegunn/goyo.vim')

" PHP Blade highlighting
call minpac#add('jwalton512/vim-blade')

" Pug templates syntax highlighting
call minpac#add('digitaltoad/vim-pug')

" Terraform syntax highlighting
call minpac#add('hashivim/vim-terraform')

" Underline word under cursor
call minpac#add('itchyny/vim-cursorword')

" Better slash search
call minpac#add('junegunn/vim-slash')

" Dart syntax highlighting
call minpac#add('dart-lang/dart-vim-plugin')

" Minpac
call minpac#add('k-takata/minpac', { 'type': 'opt' })

filetype plugin indent on     " required!

command! PackUpdate source $MYVIMRC | redraw | call minpac#update()
command! PackClean  source $MYVIMRC | call minpac#clean()

