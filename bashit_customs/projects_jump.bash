alias proj='project'
alias fproj='project'

export PROJECTS=$HOME/projects
function project {    
  local ongolang dirpath dirdepth
  goprompt="Adjusting path for Go"
  dirpath=$PROJECTS
  ongolang=false
  dirdepth=2

  if [[ $# -gt 0 ]]; then
    for i in ${@}
    do
      if [[ $ongolang ]]; then
        dirdepth=$(( $dirdepth - 1 ))
      fi

      subdirs=($(ls $dirpath | grep "^$i.*"))
      if [[ ${#subdirs[@]} -eq 1  ]]; then
        dirpath=$dirpath/${subdirs[0]}

        if [[ ${subdirs[0]} =~ ^go$ ]] && [[ !ongolang ]]; then
          echo -e "\033[32m${goprompt}\033[0m"
          dirpath=$GOSRC
          ongolang=true
          dirdepth=3
        fi
      elif [[ ${#subdirs[@]} -gt 1 ]] ; then
        _projects_list_dir ${subdirs[@]}
        dirpath=$(_projects_select_dir $dirpath ${subdirs[@]})
      else
        echo "-bash: project: No such file or directory"
      fi
    done
  else
    projects=($(ls $dirpath/ ))
    if [[ ${#projects[@]} -eq 1 ]]; then
      dirpath=$dirpath/${projects[0]}
    elif [[ ${#projects[@]} -gt 1 ]]; then
      _projects_list_dir ${projects[@]}
      dirpath=$(_projects_select_dir $dirpath ${projects[@]})
    fi

    if [[ $dirpath =~ /go$ ]]; then
      dirpath=$GOSRC
      dirdepth=3
    fi
  fi

  _projects_menu $dirdepth $dirpath

  echo $dirpath
}

function _project_fzf {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local path=$PROJECTS

  if [[ $COMP_CWORD -ne 1 ]]; then
    local prev=${COMP_WORDS[COMP_CWORD - 1]}
    _prev_path=$_prev_path/$prev
    if [[ $prev =~ ^go$ ]]; then
      path=$GOSRC
      _prev_path=$path
    elif [[ $prev =~ ^rails$ ]]; then
      path=$RAILSSRC
      _prev_path=$path
    else
      path=$_prev_path
    fi
  else
    _prev_path=$path
  fi

  __fzf_auto_complete_jump $path $cur
}

complete -o default -F _project_fzf project
complete -o default -F _project_fzf proj

function __fzf_auto_complete_jump {
  local selected fzf
  fzf="$(__fzfcmd_complete)"
  selected=$(ls -l $1 | grep ^d | sed -e "s/^.* //g" | $fzf --reverse --prompt "$1/" -q "$2" -1 --inline-info --height 40 | tr '\n' ' ')
  selected=${selected% } # Strip trailing space not to repeat "-o nospace"
  printf '\e[5n'

  if [ -n "$selected" ]; then
    COMPREPLY=( "$selected" )
    return 0
  fi
}

function _projects_menu {
  dirpath=$2
  x=0
  while [ $x -lt $1 ]
  do
    projects=($(ls $dirpath/ ))
    if [[ ${#projects[@]} -eq 1 ]]; then
      dirpath=$dirpath/${projects[0]}
    elif [[ ${#projects[@]} -gt 1 ]]; then
      _projects_list_dir ${projects[@]}
      dirpath=$(_projects_select_dir $dirpath ${projects[@]})
    fi

    x=$(( $x + 1 ))
  done

  cd ${dirpath}
}

function _projects_list_dir {
  counter=1
  larr=($@)

  echo -e "\033[33mSelect project:\033[0m"
  for i in ${larr[@]}; do
    echo "$counter. $i"
    let counter+=1
  done
}

function _projects_select_dir {
  path=$1 && shift
  sarr=($@)

  read selection
  if [[ $selection =~ [0-9]+ ]]; then
    if [[ $selection -le ${#sarr[@]} ]]; then
      local result=$path/${sarr[$selection-1]}
      echo "$result"
    else
      echo "$path"
    fi
  else
    echo "$path"
  fi
}
