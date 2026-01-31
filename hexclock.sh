#!/usr/bin/env bash
WALL="/tmp/hexclock.png"
WIDTH=1920
HEIGHT=1080
FONT="/usr/share/fonts/noto/NotoSans-Regular.ttf"
POINTSIZE=90
TEXT_COLOR="white"

while true; do
    HEX=$(date +%H%M%S)

    magick -size ${WIDTH}x${HEIGHT} xc:"#${HEX}" \
        -fill "$TEXT_COLOR" -font "$FONT" -gravity center \
        -pointsize "$POINTSIZE" \
        -annotate +0-20 "#${HEX}" \
        "$WALL"

    swww img $WALL \
	--transition-type none \
	--transition-duration 0

    sleep 0.9
done
