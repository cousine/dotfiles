function edit_and_run() {
  BUFFER="fc"
  zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run
