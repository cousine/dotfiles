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

monitors=(${(f)"$(xrandr --listmonitors | sed -e '1 d' -e  's/^\( [a-zA-Z0-9]*:\)//g' -e 's/^ \([+*a-zA-Z0-9\-]* \)//')"})


for monitor in $monitors; do
  monitor_name="${monitor[(ws: :)2]}" #maybe use to set different bgs per monitor?
  monitor_dims="${monitor[(ws: :)0]}"
  dims=(${(s:/:)monitor_dims})
  width=$dims[1]
  height="${dims[2][(ws:x:)2]}"
  xpos="${dims[3][(ws:+:)2]}"
  ypos="${dims[3][(ws:+:)3]}"

  xwinwrap -g ${width}x${height}+${xpos}+${ypos} -ov -ni -- mpv -wid WID --keepaspect=no --loop $next_wallpaper &
done
