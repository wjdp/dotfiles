export DISPLAY=:0.0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/energy_full
BAT_NOW=$BATPATH/energy_now
bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)
percent=$(( 100 * $bn / $bf ))
echo "Battery at $percent%"
if [ $percent -lt 15 ]
then
    notify-send "Battery Low" "Currently at $percent%\nYou should probably charge me" -u critical -i ~/dotfiles/icons/battery_low.svg
else
    # notify-send "Battery Is Good" "Have a nice day" -u low
fi
