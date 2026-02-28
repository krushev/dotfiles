#!/bin/bash
swaylock -e -c 000000 --image "$(find ~/.config/backgrounds/ -type f | shuf -n 1)"
