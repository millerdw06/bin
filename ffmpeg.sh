#!/bin/bash

find -type f -name "*.flac" -print0 | while read -d $'\0' a; do
    ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
done
