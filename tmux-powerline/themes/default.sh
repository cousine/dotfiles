# Default Theme

if patched_font_in_use; then
  TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
  TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
  TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
  TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else
  TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
  TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
  TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
  TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'237'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'250'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# Format: segment_name background_color foreground_color [non_default_separator]

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
  if [ $COLUMNS -le 127 ]; then
    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
      "tmux_session_info 2 0" \
    )
  elif [ $COLUMNS -le 147 ]; then
    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
      "tmux_session_info 2 0" \
      "wan_ip 1 255" \
    )
  else
    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
      "tmux_session_info 2 0" \
      "uptime 7 0" \
      #"hostname 92 255" \
      #"ifstat 30 255" \
      #"ifstat_sys 30 255" \
      #"lan_ip 214 235 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
      "wan_ip 3 0" \
      #"vcs_branch 29 88" \
      #"vcs_compare 60 255" \
      #"vcs_staged 64 255" \
      #"vcs_modified 9 255" \
      #"vcs_others 245 0" \
    )
  fi
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
  if [ $COLUMNS -le 147 ]; then
    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
      "time 4 17 ${TMUX_POWERLINE_SEPARATOR_LEFT}" \
      "battery 1 255" \
    )
  else
    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
      #"earthquake 3 0" \
      #"pwd 89 211" \
      #"mailcount 9 255" \
      #"now_playing 234 37" \
      #"cpu 240 136" \
      #"load 237 167" \
      "tmux_mem_cpu_load 3 0" \
      #"rainbarf 0 0" \
      #"xkb_layout 125 117" \
      "prayer_times 2 0" \
      "date_day 4 17" \
      "date 4 17 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
      "time 4 17 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
      "battery 1 255" \
      #"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
    )
  fi
fi
