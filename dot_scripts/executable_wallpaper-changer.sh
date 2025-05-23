#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/space/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get descriptions into an array
mapfile -t descriptions < <(hyprctl monitors | grep 'description:' | sed 's/^[ \t]*description:[ \t]*//')

# Loop over descriptions
for desc in "${descriptions[@]}"; do
    echo "Monitor description: $desc"

    WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

    hyprctl hyprpaper reload "desc:$desc","$WALLPAPER"
done
