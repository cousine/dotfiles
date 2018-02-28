#!/usr/bin/env zsh

motd() {
  if [[ -f "$HOME/motd" ]]; then
    cat $HOME/motd
  fi

  wego

  echo ""
  echo "Your pending tasks:"
  echo "==================="

  task next
  return 0
}

local tmx=$(tmux display-message -p '#I.#P')
if [[ -v INTMUX && "$tmx" = '1.0' ]]; then
  motd
fi

