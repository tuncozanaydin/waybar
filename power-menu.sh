#!/usr/bin/env bash
# Simple power menu using fuzzel's dmenu mode
choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown\n" | fuzzel --dmenu --prompt "Power: " --lines 5)

case "$choice" in
    Lock)     hyprlock ;;
    Logout)   hyprctl dispatch exit ;;
    Suspend)  systemctl suspend ;;
    Reboot)   systemctl reboot ;;
    Shutdown) systemctl poweroff ;;
esac
