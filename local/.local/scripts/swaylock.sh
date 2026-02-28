#!/bin/bash
swaylock -f -e -c 000000 --image $(find "$HOME/.config/backgrounds/" -type f | shuf -n 1)
#swaylock -f -e -c 000000 --image "$(find ~/.config/backgrounds/ -type f | shuf -n 1)"
