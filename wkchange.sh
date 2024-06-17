#!/bin/bash
var=($(hyprctl activeworkspace | grep -E 'ID' | sed 's/ID//g' | awk '{print $2}'))

##WORKSPACE
#${var[0]}
##MONITOR
#${var[1]}

case ${var[1]} in
    #samsung
    0)
        if [ ${var[0]} == 4 ]; then
            hyprctl dispatch workspace 44
        else 
            hyprctl dispatch workspace 4
        fi
        ;;
    #philips
    1)
        if [ ${var[0]} == 3 ]; then
            hyprctl dispatch workspace 33
        else 
            hyprctl dispatch workspace 3
        fi
        ;;
    #LG
    2)
        if [ ${var[0]} == '2' ]; then
            hyprctl dispatch workspace 22
        else 
            hyprctl dispatch workspace 2
        fi
        ;;
    #SONY
    3)
        if [ ${var[0]} == "1" ]; then
            hyprctl dispatch workspace 11
        else 
            hyprctl dispatch workspace 1
        fi
        ;;

    *)
        hyprctl dispatch workspace 3
        ;;
esac