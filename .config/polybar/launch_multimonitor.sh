#!/usr/bin/env bash

barname="$1"

# Assumes primary montitor is lower display number
# Inits seconary monitor first so it can own the systray
for monitor in $(xrandr --query | awk '/ connected / { print $1 }' | sort -r); do
    MONITOR=$monitor polybar --reload $barname &
    sleep 0.1
done

