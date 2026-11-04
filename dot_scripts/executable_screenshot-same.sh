#!/usr/bin/env bash

dir="$HOME/Pictures/flameshot"
mkdir -p "$dir"
[ -f /tmp/last-flameshot ] || exit 1
flameshot gui --path "$dir" --clipboard --region "$(tr -d '\n' < /tmp/last-flameshot)"
