#!/bin/sh

# Based on: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/info-redshift-temp

pid=$(pgrep -x redshift)

redshift_print() {
    if [ "$pid" ]; then
        status=$(redshift -p 2> /dev/null | grep Temp | cut -d ":" -f 2)
    else
        status="off"
    fi
    echo $status
}

redshift_toggle() {
    if [ "$pid" ]; then
        killall -e redshift
    else
        redshift > /dev/null 2>&1 &
    fi
}

case "$1" in
    toggle)
        redshift_toggle
        ;;
    *)
        redshift_print
        ;;
esac
