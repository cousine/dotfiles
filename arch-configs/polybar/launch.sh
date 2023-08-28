#!/usr/bin/env sh

# Terminate already running bar instances
killall -q -9 polybar

# Wait until the processes have been shut down
#while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar default -r 2>/home/cousine/projects/dotfiles/polybar-default &
polybar default-hdmi -r 2>/home/cousine/projects/dotfiles/polybar-hdmi &
polybar default-dp2 -r 2>/home/cousine/projects/dotfiles/polybar-dp2 &

echo "Bars launched..."
