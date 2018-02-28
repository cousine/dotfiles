cite 'about-alias'
about-alias 'go abbreviations'

# Go Commands
alias gog='go get'
alias gor='go run'
alias gob='go build'
alias goi='go install'
alias gop='project go'

#go/server/user/project

function _go_project {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local path=$GOSRC

  if [[ $COMP_CWORD -ne 1 ]]; then
    local prev=${COMP_WORDS[COMP_CWORD - 1]}
    _prev_path=$_prev_path/$prev

    path=$_prev_path
  else
    _prev_path=$path
  fi

  __fzf_auto_complete_jump $path $cur
}
complete -o default -F _go_project gop
