#!/bin/bash
ss=18
dpi=1800
solaar config 2 smart-shift $ss
solaar config 2 dpi $dpi
notify-send solaar "MX MS2 Configured ($ss/$dpi)"

