#!/bin/bash

# Check if btop is running
if pgrep -x btop > /dev/null; then
  # If it's running, kill it
  killall -9 btop
else
  # If it's not running, launch it in kitty
  # kitty --class btop btop
  wezterm start --class "btop" -- btop
fi

