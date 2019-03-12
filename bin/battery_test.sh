#!/bin/bash
BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/energy_full
BAT_NOW=$BATPATH/energy_now
bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)
percent=$(( 100 * $bn / $bf ))
echo "Battery at $percent%"
if [ $percent -lt 15 ]
then
    /usr/bin/notify-send "Battery Low" "Currently at $percent%\nYou should probably charge me" -u critical -i ~/dotfiles/icons/battery_low.svg
    echo "bad" >> $HOME/bat
else
    /usr/bin/notify-send "Battery Is Good" "Have a nice day" -u low
    echo "good" >> $HOME/bat
fi
