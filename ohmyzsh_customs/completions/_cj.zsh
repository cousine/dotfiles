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

      _multi_parts " " "($(ls -l $_path | grep '^d' | sed -e 's/^.* //g' | tr '\n' ' '))"
      ;;
  esac
}

_cj "$@"
