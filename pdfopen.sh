#!/bin/bash

dir="$1"
input="$dir/.edc"
pdfopen=false

while read -r line
do
    if [ "$line" = "#pdfopen" ]; then
        pdfopen=true
    elif [ "$pdfopen" ]; then
        if [ "$line" = "#*" ]; then
            break
        fi
        xdg-open "$dir/$line"
    fi
done < "$input"