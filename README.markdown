# wjdp dotfiles

## Install

1. Clone the repo into ~
1. `sudo apt install ansible`
1. `ansible-galaxy install -r requirements.yml`
1. `bin/dot-bootstrap`

## Update just one role

1. `dot-update <tag>`

## Sway

### Finding the correct temperature sensor

- `sensors` and identify, e.g. k10temp-pci-00c3
- `bat /sys/class/hwmon/hwmon*/name` to lookup sensor names
- Then use `/sys/class/hwmon/hwmon*/temp1_input` for the temperature

Though there is a chance of the path changing on reboot, doesn't seem to be a solution for now.

- See https://github.com/Alexays/Waybar/issues/1943
- See https://github.com/Alexays/Waybar/issues/1700
