#!/bin/bash

ALIGNMENT=""

case "$1" in
  top-left|top-right|bottom-left|bottom-right)
    ALIGNMENT="-f CaskaydiaCoveNerdFont:size=10 -w 16 -a $1"
    ;;
  *)
    ALIGNMENT="-f CaskaydiaCoveNerdFont:size=16 -w 18 --line-height=25 -x 50 -y 20 -P 20" 
    ;;
esac

SELECTION="$(printf "󰌾 Lock\n󰤄 Suspend\n󰍃 Log out\n Reboot\n Reboot to UEFI\n󰐥 Shutdown" | fuzzel --dmenu $ALIGNMENT -l 6 -p "")"

confirm_action() {
    local action="$1"
    CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu $ALIGNMENT -l 2 -w 18 -p "$action?")"
    [[ "$CONFIRMATION" == *"Yes"* ]]
}

case $SELECTION in
    *"󰌾 Lock"*)
#	    swaylock -f -e -c 000000 --image "$(find ~/.config/backgrounds/ -type f | shuf -n 1)";;
      hyprlock;;
    *"󰤄 Suspend"*)
      if confirm_action "Suspend"; then
          systemctl suspend
      fi;;
    *"󰍃 Log out"*)
      if confirm_action "Log out"; then
		    # killall -9 Hyprland
        hyprctl dispatch exit
        #swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your     Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
      fi;;
    *" Reboot"*)
      if confirm_action "Reboot"; then
        systemctl reboot
      fi;;
    *" Reboot to UEFI"*)
      if confirm_action "Reboot to UEFI"; then
        systemctl reboot --firmware-setup
      fi;;
    *"󰐥 Shutdown"*)
      if confirm_action "Shutdown"; then
        systemctl poweroff
      fi;;
esac
