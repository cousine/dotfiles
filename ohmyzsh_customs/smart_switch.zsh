export SWITCHERS=$HOME/bin/switchers
alias sw=switch

switch() {
  if [ $# -le 0 ]; then
    echo "Invalid number of arguments; this command requires at least 1 argument"
  else
    while [ "$#" -gt 0 ]; do
      switcher="${SWITCHERS}/switch_${1}" 
      if [ -f $switcher ]; then
        echo `${switcher}`
      else
        echo "${switcher} doesn't exist, skipping."
      fi
      shift 1
    done
  fi
}
