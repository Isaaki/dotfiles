#!/usr/bin/env bash
playerctl -a pause
pidof hyprlock || hyprlock
