#!/bin/sh

# Original: https://raw.githubusercontent.com/polybar/polybar-scripts/master/polybar-scripts/system-bluetooth-bluetoothctl/system-bluetooth-bluetoothctl.sh

bluetoothctl | while read -r; do
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        counter=0

        echo "$devices_paired" | while read -r line; do
            device_info=$(bluetoothctl info "$line")

            if echo "$device_info" | grep -q "Connected: yes"; then
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                if [ $counter -gt 0 ]; then
                    printf ", %s" "$device_alias"
                else
                    printf "%s" "$device_alias"
                fi

                counter=$((counter + 1))
            fi
        done

        printf "\n"
    fi
done
