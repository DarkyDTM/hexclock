#!/usr/bin/env bash
WALL="/tmp/hexclock.png"
WIDTH=1920
HEIGHT=1080
FONT="Roboto-Mono-Regular"
POINTSIZE=90
TEXT_COLOR="white"

while true; do
    HEX=$(date +%H%M%S)

    magick -size ${WIDTH}x${HEIGHT} xc:"#${HEX}" \
        -fill "$TEXT_COLOR" -font "$FONT" -gravity center \
        -pointsize "$POINTSIZE" \
        -annotate +0-20 "#${HEX}" \
        "$WALL"

    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALL"
    sleep 1
done
