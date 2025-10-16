#!/bin/bash

# Kill any running Waybar instances
killall waybar

# Start Waybar in the background
waybar &
