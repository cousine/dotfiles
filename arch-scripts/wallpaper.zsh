#!/usr/bin/env zsh
killall -q xwinwrap

while pgrep -x xwinwrap >/dev/null; do sleep 1; done

export WALLPAPERS="$HOME/.config/wallpapers"

# Get a list of all wallpapers
wallpapers=($WALLPAPERS/*.(jpg|jpeg|gif|png))

# if we don't have a file, start at zero
if [ ! -f "/tmp/wallpaper.dat" ] ; then
  if [ ! -f "$HOME/.config/wallpaper.dat" ]; then
    next_wallpaper=${wallpapers[1]}
  else
    next_wallpaper=`cat $HOME/.config/wallpaper.dat`
  fi
# otherwise read the value from the file
else
  current_wallpaper=`cat /tmp/wallpaper.dat`
  next_wallpaper_id=$((${wallpapers[(ie)$current_wallpaper]}))
  while getopts ":n" opt; do
    case $opt in
      n)
        next_wallpaper_id=$((${wallpapers[(ie)$current_wallpaper]}+1))
        ;;
      *)
        next_wallpaper_id=$((${wallpapers[(ie)$current_wallpaper]}))
        ;;
    esac
  done

  if [ ! $next_wallpaper_id -ge ${#wallpapers} ] ; then
    next_wallpaper=${wallpapers[next_wallpaper_id]}
  else
    next_wallpaper=${wallpapers[1]}
  fi
fi

echo ${next_wallpaper} > /tmp/wallpaper.dat
xwinwrap -ov -ni -fs -- mpv -wid WID --keepaspect=no --loop $next_wallpaper
