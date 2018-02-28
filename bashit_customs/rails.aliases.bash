cite 'about-alias'
about-alias 'rails abbreviations'

# Go Commands
alias rop='project rails'


function _rails_project {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local path=$RAILSSRC

  if [[ $COMP_CWORD -ne 1 ]]; then
    local prev=${COMP_WORDS[COMP_CWORD - 1]}
    _prev_path=$_prev_path/$prev

    path=$_prev_path
  else
    _prev_path=$path
  fi

  __fzf_auto_complete_jump $path $cur
}
complete -o default -F _rails_project rop
