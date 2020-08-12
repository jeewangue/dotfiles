#! /bin/bash
pacman -Qqen > "$(date +%y%m%d-%H%M%S)-pacman-pkgs.txt"
pacman -Qqem > "$(date +%y%m%d-%H%M%S)-yay-pkgs.txt"
pacman -Qg > "$(date +%y%m%d-%H%M%S)-pacman-groups.txt"
