#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title KittyMux
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⌨️
# @raycast.argument1 { "type": "text", "placeholder": "session name", "optional": true }
# @raycast.currentDirectoryPath ~

# Documentation:
# @raycast.description Runs a Kitty terminal with a tmux session
# @raycast.author Omar Mekky
# @raycast.authorURL https://cousine.me

export SESSION_NAME="main"

if [[ -n $1 ]]; then
  SESSION_NAME=$1
fi

kitty --start-as=fullscreen tmux -L "$SESSION_NAME" new-session -A -s "cousine-$SESSION_NAME"
