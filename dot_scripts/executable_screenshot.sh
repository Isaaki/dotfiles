#!/usr/bin/env bash

dir="$HOME/Pictures/flameshot"
mkdir -p "$dir"
geom=$(flameshot gui --path "$dir" --clipboard --print-geometry) || exit 0
[ -n "$geom" ] && echo "$geom" > /tmp/last-flameshot
