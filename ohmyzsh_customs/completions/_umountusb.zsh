#compdef umountusb

_umountusb() {
  local state

  _arguments \
    '*: :->device'

  case $state in
    device)
      _multi_parts " " "($(ls -l $MOUNTS | grep '^b' | sed -e 's/^.* //g' | tr '\n' ' '))"
      ;;
  esac
}

_umountusb "$MOUNTS/$@"
