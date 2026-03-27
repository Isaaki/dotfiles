#!/usr/bin/env bash

# Define the precise application name found in your pactl output
PLEXAMP_APP_NAME="ALSA plug-in [plexamp]"
VOLUME_STEP="2%"

# Function to get the Sink Input ID for Plexamp
get_sink_input_id() {
    # This command uses grep to filter the pactl list, looking for the specific application name.
    pactl list sink-inputs | awk '
        /Sink Input #/ {id=$3}
        /application\.name.*=.*"'".*plexamp.*"'"/ {print substr(id, 2); exit}
    '
}

# Find the ID
SINK_INPUT_ID=$(get_sink_input_id)

if [ -z "$SINK_INPUT_ID" ]; then
    # If Plexamp is not running or not playing audio, exit silently.
    echo "plexamp not running"
    exit 0
fi

# Determine the action based on the script argument and apply it using pactl
case "$1" in
    "up")
        pactl set-sink-input-volume "$SINK_INPUT_ID" "+$VOLUME_STEP"
        ;;
    "down")
        pactl set-sink-input-volume "$SINK_INPUT_ID" "-$VOLUME_STEP"
        ;;
    "mute")
        pactl set-sink-input-mute "$SINK_INPUT_ID" "toggle"
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac
