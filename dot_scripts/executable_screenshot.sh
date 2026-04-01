#!/usr/bin/env bash

set -e
mkdir -p "$HOME/Pictures/satty"
region=$(slurp -d)
echo "$region" > /tmp/last-slurp
grim -t ppm -g "$region" - | "$HOME/.local/bin/satty" \
    --filename - \
    --initial-tool arrow \
    --copy-command wl-copy \
    --brush-smooth-history-size 5 \
    --disable-notifications \
    --actions-on-escape "save-to-clipboard,exit" \
    --output-filename "$HOME/Pictures/satty/$(date '+%Y-%m-%d_%H-%M-%S').png"
