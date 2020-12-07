#!/usr/bin/env bash

options="\
reload-config
lock-screen
logout
shutdown
reboot
suspend+hibernate
hibernate"

option=$(echo "$options" | $HOME/Bin/rofi-sway -dmenu -monitor 0 -p power)

lock=true
powercmd=true

case "$option" in
    "reload-config") lock=false ; powercmd="swaymsg reload" ;;
    "lock-screen") ;;
    "logout") powercmd="swaymsg exit" ;;
    "shutdown") powercmd="shutdown -h now" ;;
    "reboot") powercmd="systemctl reboot" ;;
    "suspend+hibernate") powercmd="systemctl suspend-then-hibernate" ;;
    "hibernate") powercmd="systemctl hibernate" ;;
    *) lock=false ;;
esac

$($lock) && swaylock --daemonize --clock --indicator --screenshots --effect-blur 20x2 --effect-vignette 0.5:0.5
$($powercmd)
