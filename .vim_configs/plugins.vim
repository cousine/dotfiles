" ========================================================================
" PLUGINS
" ========================================================================

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

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

  " Task Warrior Integration
  call dein#add('blindFS/vim-taskwarrior')

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

filetype plugin indent on     " required!
