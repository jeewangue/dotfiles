#! /usr/bin/env bash

filesystem_template () {
    printf "\${color2}󰋊 $1 \${alignr 12}\${color}"
    printf "\n"
    printf "\${fs_used $1} / \${fs_size $1} \${fs_bar 8,70 $1} "

    if [ $2 -ge 90 ]; then
        printf "\${color9}\${fs_used_perc $1}%%\${color}"
    elif [ $2 -ge 70 ]
    then
        printf "\${color8}\${fs_used_perc $1}%%\${color}"
    else
        printf "\${color7}\${fs_used_perc $1}%%\${color}"
    fi
    printf "\n"
    printf " Write \t\${diskio_write $3}"
    printf "\n"
    printf " Read \t\${diskio_read $3}"
    printf "\n"

}

df -h -t ext4 -t vfat -t fuse -t ntfs -t nfs -t nfs4 -t btrfs --output=source,target,pcent,avail | grep -v "boot" | tail -n +2 | \
    while read -r src target pcent avail ; do
        filesystem_template $target ${pcent%\%} $src
    done

