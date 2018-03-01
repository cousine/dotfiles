" ========================================================================
"                 _          
"  __ ___ _  _ __(_)_ _  ___ 
" / _/ _ \ || (_-< | ' \/ -_)
" \__\___/\_,_/__/_|_||_\___|
"                            
" ---------------------------
"                            
" AUTHOR       : Omar Mekky
" EMAIL        : alphaengine@gmail.com
" GITHUB       : https://github.com/cousine
" LAST UPDATED : 28-02-2018
"                            
" ========================================================================

if &compatible
  set nocompatible               " Be iMproved
endif

" ========================================================================
" Load Plugins
" ========================================================================
if filereadable(expand("~/.vim_configs/plugins.vim"))
  source ~/.vim_configs/plugins.vim
endif

" ========================================================================
" NeoVim Specific Settings
" ========================================================================
if filereadable(expand("~/.vim_configs/neovim_settings.vim"))
  source ~/.vim_configs/neovim_settings.vim
endif

" ========================================================================
" Vanilla Settings
" ========================================================================
if filereadable(expand("~/.vim_configs/settings.vim"))
  source ~/.vim_configs/settings.vim
endif

" ========================================================================
" Plugins Settings
" ========================================================================
if filereadable(expand("~/.vim_configs/plugins_settings.vim"))
  source ~/.vim_configs/plugins_settings.vim
endif

" ========================================================================
" Key Bindings
" ========================================================================
if filereadable(expand("~/.vim_configs/keys.vim"))
  source ~/.vim_configs/keys.vim
endif

" ========================================================================
" Custom Commands and Functions
" ========================================================================
if filereadable(expand("~/.vim_configs/functions.vim"))
  source ~/.vim_configs/functions.vim
endif

