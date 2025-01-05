#!/bin/bash
# __  ______   ____ 
# \ \/ /  _ \ / ___|
#  \  /| | | | |  _ 
#  /  \| |_| | |_| |
# /_/\_\____/ \____|
#                   

# Setup Timers
_sleep1="0.1"
_sleep2="0.5"

# Kill all possible running xdg-desktop-portals
#killall -e xdg-desktop-portal-hyprland
#killall -e xdg-desktop-portal-gtk
#killall -e xdg-desktop-portal

# Set required environment variables
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_SESSION_DESKTOP XDG_CURRENT_DESKTOP

# Stop all services
systemctl --user stop pipewire 
systemctl --user stop wireplumber 
systemctl --user stop xdg-desktop-portal 
systemctl --user stop xdg-desktop-portal-gtk 
systemctl --user stop xdg-desktop-portal-hyprland
sleep $_sleep1

# Start xdg-desktop-portal-hyprland
#/usr/libexec/xdg-desktop-portal-hyprland &
#sleep $_sleep1

# Start xdg-desktop-portal-gtk
#if [ -f /usr/libexec/xdg-desktop-portal-gtk ] ;then
#    /usr/libexec/xdg-desktop-portal-gtk &
#    sleep $_sleep1
#fi

# Start xdg-desktop-portal
#/usr/libexec/xdg-desktop-portal &
#sleep $_sleep2

# Start required services
systemctl --user start pipewire 
systemctl --user start wireplumber 
systemctl --user start xdg-desktop-portal 
systemctl --user start xdg-desktop-portal-gtk 
systemctl --user start xdg-desktop-portal-hyprland

# Run waybar
#sleep $_sleep1
#~/.config/waybar/launch.sh
