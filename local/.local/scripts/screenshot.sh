#!/usr/bin/env sh
# Take a screenshot on wayland with swaymsg, jq, grim, slurp, and swappy
#
# Make sure the script is executable (chmod +x ./screenshot.sh)
#
# If you don't use sway, replace `swaymsg` with whatever your window manager
# gives you to query window information.
#
# Example sway configuration
#
# bindsym Print             exec ~/.local/bin/screenshot.sh region
# bindsym Shift+Print       exec ~/.local/bin/screenshot.sh window
# bindsym Ctrl+Print        exec ~/.local/bin/screenshot.sh output
# bindsym Ctrl+Shift+Print  exec ~/.local/bin/screenshot.sh all


# region|window|output|all
mode="$1"

case $mode in
    "region")
        grim -g "$(slurp)" - | swappy -f -
        ;;
    "window")
      case "${XDG_CURRENT_DESKTOP:-}" in
        niri)     grim -g "$(niri msg -j focused-window | jq -r '.["visible-geometry"] | "\(.x),\(.y) \(.width)x\(.height)"')" - | swappy -f - ;;
        Hyprland) grim -g "$(hyprctl activewindow -j | jq -r ' "\(.at[0] | floor),\(.at[1] | floor) \(.size[0] | floor)x\(.size[1] | floor)" ')" - | swappy -f - ;;
        sway)     grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | swappy -f - ;;
        *)        echo "Unknown or unset" ;;
      esac
        ;;
    "output")
      case "${XDG_CURRENT_DESKTOP:-}" in
        niri)     grim -o "$(niri msg -j outputs | jq -r '.[] | select(.focused) | .name')" - | swappy -f - ;;
        Hyprland) grim -o "$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name' | head -n1)" - | swappy -f - ;;
        sway)     grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | swappy -f - ;;
        *)        echo "Unknown or unset" ;;
      esac
        ;;
    "all")
        grim - | swappy -f -
        ;;
    *)
        echo >&2 "unsupported command \"$mode\""
        echo >&2 "Usage:"
        echo >&2 "screenshot.sh <region|window|output|all>"
        exit 1
esac
