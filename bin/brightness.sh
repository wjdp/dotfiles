#!/bin/bash

# how much we change the brightness is the input parameter
change=$1
echo $change

if (( $change > 0 )); then
    sudo ybacklight -inc $change
else
    sudo ybacklight -dec ${change#-}
fi
