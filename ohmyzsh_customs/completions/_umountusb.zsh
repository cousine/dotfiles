#compdef umountusb

_umountusb() {
  local state directories _real_path _path=$MOUNTS

  _arguments \
    '*: :->device'

  directories=(${words:1})

  case $state in
    device)
      _multi_parts " " "($(ls -l $MOUNTS | grep '^b' | sed -e 's/^.* //g' | tr '\n' ' '))"
      ;;
  esac
}

_umountusb "$MOUNTS/$@"
