#! /bin/bash
sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(grep -v -E '#|^\s*$' pkglist-pacman.txt | sort))

yay -S $(comm -12 <(yay -Slq | sort) <(grep -v -E '#|^\s*$' pkglist-yay.txt | sort))
