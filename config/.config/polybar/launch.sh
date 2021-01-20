#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar > /dev/null; do sleep 1; done

# Launch primary bar
if type "xrandr"; then
	m=$(xrandr --query | grep " connected" | grep -i "eDP" | cut -d" " -f1 | head -n 1)
	MONITOR=$m polybar primary &
fi

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | grep -v "eDP" | cut -d" " -f1); do
		MONITOR=$m polybar secondary &
	done
fi

echo "Bars launched..."
