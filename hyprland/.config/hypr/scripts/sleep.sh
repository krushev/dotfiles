#!/bin/sh

swayidle -w timeout 300 '~/.config/hypr/scripts/swaylock.sh' \
            timeout 600 'systemctl suspend' \
            before-sleep '~/.config/hypr/scripts/swaylock.sh' &
