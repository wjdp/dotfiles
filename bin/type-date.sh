#!/bin/bash
date +%Y-%m-%d  | sed 's/./usleep 2,str &,/g' | xargs -d, xte
