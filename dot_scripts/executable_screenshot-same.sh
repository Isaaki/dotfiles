#!/usr/bin/env bash

set -e
mkdir -p "$HOME/Pictures/satty"
grim -t ppm -g "$(tr -d '\n' < /tmp/last-slurp)" - | satty \
    --filename - \
    --initial-tool arrow \
    --copy-command wl-copy \
    --brush-smooth-history-size 5 \
    --disable-notifications \
    --actions-on-escape "save-to-clipboard,exit" \
    --output-filename "$HOME/Pictures/satty/$(date '+%Y-%m-%d_%H-%M-%S').png"
