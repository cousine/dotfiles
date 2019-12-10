#!/usr/bin/env zsh

setWallpaper()
{
  killall -q xwinwrap

  while pgrep -x xwinwrap >/dev/null; do sleep 1; done

  echo ${1} > /tmp/wallpaper.dat
  if [ ! -z $2 ]; then
    echo ${1} > $HOME/.config/wallpaper.dat
    dunstify -u 1 -a wallpaper "Wallpaper Set" ${1}
  elif [ ! ${#@} -gt 1  ]; then
    dunstify -u 1 -a wallpaper "Temporary Wallpaper Set" ${1}
  fi

  monitors=(${(f)"$(xrandr --listmonitors | sed -e '1 d' -e  's/^\( [a-zA-Z0-9]*:\)//g' -e 's/^ \([+*a-zA-Z0-9\-]* \)//')"})

  for monitor in $monitors; do
    monitor_name="${monitor[(ws: :)2]}" #maybe use to set different bgs per monitor?
    monitor_dims="${monitor[(ws: :)0]}"
    dims=(${(s:/:)monitor_dims})
    width=$dims[1]
    height="${dims[2][(ws:x:)2]}"
    xpos="${dims[3][(ws:+:)2]}"
    ypos="${dims[3][(ws:+:)3]}"
    extension="${1##*.}"

    if [[ $#monitors -eq 1 ]]; then
      if [[ $extension = "gif" ]]; then
        xwinwrap -g ${width}x${height}+${xpos}+${ypos} -ov -ni -- mpv -wid WID --keepaspect=no --loop $1 &
      else
        xwinwrap -g ${width}x${height}+${xpos}+${ypos} -ov -ni -- feh --bg-fill $1 &
      fi
    else
      xwinwrap -g ${width}x${height}+${xpos}+${ypos} -ov -ni -- feh --bg-fill $1 &
    fi
  done
}

getCurrentWallpaper()
{
  # if we don't have a file, start at zero
  if [ ! -f "/tmp/wallpaper.dat" ] ; then
    if [ ! -f "$HOME/.config/wallpaper.dat" ]; then
      next_wallpaper_id=1
    else
      current_wallpaper=`cat $HOME/.config/wallpaper.dat`
      next_wallpaper_id=$((${wallpapers[(ie)$current_wallpaper]}))
    fi
  else
    current_wallpaper=`cat /tmp/wallpaper.dat`
    next_wallpaper_id=$((${wallpapers[(ie)$current_wallpaper]}))
  fi

  echo "$next_wallpaper_id"
}

getNextWallpaper()
{
  wallpaper_id=$1
  if [[ ! $wallpaper_id -gt ${#wallpapers} && ! $wallpaper_id -le 0 ]] ; then
    next_wallpaper=${wallpapers[wallpaper_id]}
  else
    if [[ $wallpaper_id -le 0 ]]; then
      next_wallpaper=${wallpapers[-1]}
    else
      next_wallpaper=${wallpapers[1]}
    fi
  fi
  echo "$next_wallpaper"
}

# Get a list of all wallpapers
wallpapers=($WALLPAPERS_DIR/*.(jpg|jpeg|gif|png))
current_wallpaper_id=`getCurrentWallpaper`

while getopts ":nr" opt; do
  case $opt in
    n)
      next_wallpaper_id=$((${current_wallpaper_id}+1))
      next_wallpaper=`getNextWallpaper ${next_wallpaper_id}`
      ;;
    r)
      next_wallpaper_id=$((${current_wallpaper_id}-1))
      next_wallpaper=`getNextWallpaper ${next_wallpaper_id}`
      ;;
    \?)
      echo "Invalid Option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done

if [ ! -z $next_wallpaper ]; then
  setWallpaper $next_wallpaper
  exit 0
fi

if [ ! -z $1 ]; then
  shift $((OPTIND -1))
  setWallpaper $1 true
else
  read wallpaper
  setWallpaper $wallpaper true
fi



