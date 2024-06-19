#!/bin/bash
var=($(hyprctl activeworkspace | grep -E 'ID' | sed 's/ID//g' | awk '{print $2}'))
##WORKSPACE #${var[0]}
##MONITOR #${var[1]}

case ${var[1]} in
    #samsung(id=0)
    0) [ ${var[0]} == '4' ] && hyprctl dispatch workspace 44 || hyprctl dispatch workspace 4 ;;
    #philips(id 1)
    1) [ ${var[0]} == '3' ] && hyprctl dispatch workspace 33 || hyprctl dispatch workspace 3 ;;
    #LG(id=2)
    2) [ ${var[0]} == '2' ] && hyprctl dispatch workspace 22 || hyprctl dispatch workspace 2 ;;
    #SONY(id=3)
    3) [ ${var[0]} == '1' ] && hyprctl dispatch workspace 11 || hyprctl dispatch workspace 1 ;;
    #ERROR/DEFAULT
    *) hyprctl dispatch workspace 3 ;;
esac