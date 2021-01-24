#! /usr/bin/env bash

filesystem_template () {
    printf " $1 \${alignr 12}"
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

}

df -h -t ext4 -t vfat -t fuse -t ntfs -t nfs -t nfs4 --output=target,pcent,avail | grep -v "boot" | tail -n +2 | \
    while read -r target pcent avail ; do
        filesystem_template $target ${pcent%\%}
    done

