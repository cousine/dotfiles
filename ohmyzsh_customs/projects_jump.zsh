export PROJECTS=$HOME/Projects

cj() {    
  if [[ $# -gt 0 ]]; then
    local _path directories

    directories=($@)
    if [[ $directories[1] = "go" ]]; then
      directories[1]="go/src"
    fi

    _path="$PROJECTS/${(j:/:)directories}"

    cd $_path
  else
    cd $PROJECTS
  fi
}

