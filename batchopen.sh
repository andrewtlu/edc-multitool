#!/bin/bash

dir="$1"
input="$dir/.edc"
command=false

while read -r line
do
    if [ "$line" = "#batchopen" ]; then
        command=true
    elif [ "$command" ]; then
        if [ "$line" = "#*" ]; then
            break
        fi
        xdg-open "$dir/$line"
    fi
done < "$input"