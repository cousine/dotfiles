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

local tmx=$(tmux display-message -p '#I.#P')
if [[ -v INTMUX && "$tmx" = '1.0' ]]; then
  motd
fi

