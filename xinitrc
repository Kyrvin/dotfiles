#! /bin/bash

wallpaper="$XDG_DESKTOP_DIR/wallpaper.png"
locker="i3lock -i $wallpaper -t -e -p default"

if [ $(xrandr | grep " connected" | wc -l) -gt 1 ]; then
	xrandr --output HDMI1 --auto --primary --left-of eDP1 --auto
else
	xrandr --output eDP1 --auto --primary
fi

xsetroot -cursor_name left_ptr &
feh --no-fehbg --bg-fill "$wallpaper" &
thunar --daemon &
xautolock -time 5 -locker "$locker" -detectsleep &
dunst &
sxhkd &
compton -b &
panel &

exec bspwm
