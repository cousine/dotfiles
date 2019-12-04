#!/usr/bin/env zsh

export SET_WALLPAPER_COMMAND=~/bin/wallpaper.zsh

if [ -z $@ ]; then
  ls ${WALLPAPERS_DIR}
else
  coproc ( "${SET_WALLPAPER_COMMAND}" "${WALLPAPERS_DIR}/${@}"  > /dev/null  2>&1 )
  #exit;
fi
