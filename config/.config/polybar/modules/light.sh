#!/bin/sh

pid=$(pgrep -x redshift)

light_print() {
    while true; do
				sleep 3;
        echo $(light -G | cut -d "." -f 1)
        inotifywait -e modify /sys/class/backlight/intel_backlight/brightness > /dev/null 2>&1
    done
}

light_dec() {
    light -U 10
}

light_inc() {
    light -A 10
}

case "$1" in
    dec)
        light_dec
        ;;
    inc)
        light_inc
        ;;
    *)
        light_print
        ;;
esac
