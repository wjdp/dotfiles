#!/bin/bash
for f in *.{jpg,JPG,png,PNG,jpeg,JPEG,html}; do
    type=$( file "$f" | grep -oP '\w+(?= image data)' )
    case $type in
        PNG)  newext=png ;;
        JPEG) newext=jpg ;;
        *)    echo "??? what is this: $f"; continue ;;
    esac
    ext=${f##*.}   # remove everything up to and including the last dot
    if [[ $ext != $newext ]]; then
        # remove "echo" if you're satisfied it's working
        mv "$f" "${f%.*}.$newext"
    fi
done

