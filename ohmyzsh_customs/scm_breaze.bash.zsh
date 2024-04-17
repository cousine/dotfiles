alias gghelp=git_aliases
alias gccl=git_clone_clipboard

# Clone url currently in clipboard
function git_clone_clipboard {
  gcl "$(pbpaste)"
}
