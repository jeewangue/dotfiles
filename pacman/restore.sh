#! /bin/bash
sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(sort pkglist-pacman.txt))
yay -S $(comm -12 <(yay -Slq | sort) <(sort pkglist-yay.txt))
