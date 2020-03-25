# pacman backup strategy

## backup

```bash
# packages in official sync db
pacman -Qqen > pkglist-pacman.txt

# packages in AUR
pacman -Qqem > pkglist-yay.txt
```

## restore

```bash
# using `comm` command compares the list with actual sync db
sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(sort pkglist-pacman.txt))
```

```bash
# likewise with AUR
yay -S $(comm -12 <(yay -Slq | sort) <(sort pkglist-yay.txt))
```

