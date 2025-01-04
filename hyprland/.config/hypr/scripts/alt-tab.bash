#!/usr/bin/env bash

active_workspace="$(hyprctl activewindow -j | jq -r ".workspace.id")"
if [ "$active_workspace" = "null" ]; then exit; fi

previous_client="$(hyprctl clients -j | jq -r '[.[] | select(.workspace.id == '"$active_workspace"')] | sort_by(.focusHistoryID) | nth(1) | .address')"
if [ "$previous_client" = "null" ]; then exit; fi

# TODO: Replace `bringactivetotop` with `alterzorder top` after https://github.com/hyprwm/Hyprland/issues/5490 is fixed
hyprctl --batch "dispatch focuswindow address:$previous_client; dispatch bringactivetotop"
