cj() {    
  if [[ $# -gt 0 ]]; then
    local _path directories

    directories=($@)
    if [[ $directories[1] = "go" ]]; then
      directories[1]="go/src"
    fi

    _path="$PROJECT_PATHS/${(j:/:)directories}"

    cd $_path
  else
    cd $PROJECT_PATHS
  fi
}

