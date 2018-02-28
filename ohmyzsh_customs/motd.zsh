#!/usr/bin/env zsh

motd() {
  if [[ -f "$HOME/motd" ]]; then
    cat $HOME/motd
  fi

  task next
}

motd
