#!/bin/bash

# Get clipboard content
CLIP_CONTENT=$(wl-paste)

# Check if clipboard is not empty
if [[ -z "$CLIP_CONTENT" ]]; then
  echo "Clipboard is empty."
  exit 1
fi

# Launch mpv with clipboard content
notify-send "Starting mpv" "$CLIP_CONTENT"
mpv "$CLIP_CONTENT"
