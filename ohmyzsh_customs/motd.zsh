#!/usr/bin/env zsh

motd() {
  if [[ -f "$HOME/motd" ]]; then
    cat $HOME/motd
  fi
  
  if [[ -f "$HOME/.motd.zsh" ]]; then
    source $HOME/.motd.zsh
  fi

  return 0
}

local tmx=$(tmux display-message -p '#S:#I.#P' 2>&1)
if [[ -v INTMUX && "$tmx" = 'cousine-main:1.0' || "$tmx" = 'cousine-secondary:1.0' ]]; then
  motd
fi

