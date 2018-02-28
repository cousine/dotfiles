#compdef cj

_cj() {
  local state directories _real_path _path=$PROJECTS

  _arguments \
    '1: :->proj_stack'\
    '*: :->proj_name'

  directories=(${words:1})

  case $state in
    proj_stack)
      _multi_parts " " "($(ls -l $PROJECTS | grep '^d' | sed -e 's/^.* //g' | tr '\n' ' '))"
      ;;
    *) 
      if [[ $directories[1] = "go" && $CURRENT -gt 2 ]]; then
        directories[1]="go/src"
      fi

      if [[ $CURRENT -gt 2 && ${#words[CURRENT]} -gt 0 ]]; then
        unset "directories[${#directories[@]-1}]"
      fi

      _path="$PROJECTS/${(j:/:)directories}"
      #printf "\n>>>>>>>>> $CURRENT $_path $directories\n"

      _multi_parts " " "($(ls -l $_path | grep '^d' | sed -e 's/^.* //g' | tr '\n' ' '))"
      ;;
  esac
  #local cur=${words[CURRENT]}
  #local _path=$PROJECTS
  #local _prev_path

  #if [[ $CURRENT -ne 1 ]]; then
    #if [[ ${#_prev_path} -eq 0 ]] then
      #_prev_path=$_path
    #else
      #local prev=${words[CURRENT - 1]}
      #_prev_path=$_prev_path/$prev
    #fi

    #case ${words[1]} in
      #go)
        #_path=$GOSRC
        #_prev_path=$_path
        #;;
      #rails)
        #_path=$RAILSSRC
        #_prev_path=$_path
        #;;
      #*)
        #_path=$_prev_path
        #;;
    #esac
  #else
    #_prev_path=$_path
  #fi

  #compadd "$@" $(__fzf_auto_complete_jump $_path $cur)
}

_cj "$@"
