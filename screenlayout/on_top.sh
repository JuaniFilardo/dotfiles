#!/bin/sh
xrandr --output eDP1 --primary --mode 2160x1440 --pos 0x1180 --rotate normal --output DP1 --mode 1920x1080 --pos 120x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off && killall -SIGUSR1 conky;
conky -c /home/filardo/.config/conky/conky_second_monitor.conf
