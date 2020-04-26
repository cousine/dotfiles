#compdef switch sw=switch

_switch() {
  local state
  
  _arguments \
    '*: :->switcher'

  case $state in
    switcher)
      _multi_parts " " "($(ls $SWITCHERS | grep '^switch_' | sed -e 's/^switch_//g' | tr '\n' ' '))"
      ;;
  esac
}

_switch 
