#!/bin/bash
playerctl -a pause
pidof hyprlock || hyprlock
