#!/usr/bin/env bash
# Detected if dock is connected and select xrandr conf
if [ -z "$(lsusb -v 2>&1 > /dev/null | grep 17ef:a357)" ]
then
    "$HOME"/.config/i3/scripts/w-dock.sh 
    MAIN_MONITOR="DVI-I-2-2"
else
    MAIN_MONITOR="eDP1"
fi


# set bottom bar on all monitor
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#  MONITOR=$m polybar --reload bottom &
#done
#export MONITOR
export MAIN_MONITOR
i3-msg restart