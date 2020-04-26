export MOUNTS=/dev

mountusb() {
  _mount_helper mount $1
}

umountusb() {
  _mount_helper unmount $1
}

_mount_helper() {
  local _path

  _path="$MOUNTS/$2"
  udisksctl $1 -b $_path
}
