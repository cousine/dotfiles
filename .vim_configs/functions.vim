" Auto reload .vimrc on save
"augroup reload_vimrc " {
"autocmd!
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

function! s:ToggleColorColumn()
  if s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    windo let &colorcolumn = 0
  else
    windo let &colorcolumn=s:color_column_old
    let s:color_column_old = 0
  endif
endfunction

" Automatically delete trailing whitespaces

function! CleanTrailingWhites(command)
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
autocmd FileType ruby autocmd BufWritePre <buffer> :call CleanTrailingWhites("%s/\\s\\+$//e")

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

" Save session
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

" Fix CSS3 to include hyphens as keywords
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

