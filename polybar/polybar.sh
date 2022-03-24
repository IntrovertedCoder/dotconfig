#! /usr/bin/sh
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example 2> /dev/null &
  done
else
  polybar --reload example &
fi
