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


## rankmirrors

`rankmirrors` is in `pacman-contrib` package

```bash
COUNTRIES="country=KR&country=JP&country=US"
curl -sL "https://www.archlinux.org/mirrorlist?${COUNTRIES}&protocol=https&use_mirror_statue=on" | sed -e 's/^#Server/Server/' -e '/^#/d' > mirrorlist
rankmirrors -n 10 mirrorlist | sudo tee /etc/pacman.d/mirrorlist
```

## install `yay`

```bash
mkdir -p ~/AUR
cd ~/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

in `~/.config/yay/config.json` file

```json
{
        "aururl": "https://aur.archlinux.org",
        "buildDir": "$HOME/AUR",
        "absdir": "$HOME/AUR/abs",
        "editor": "",
        "editorflags": "",
        "makepkgbin": "makepkg",
        "makepkgconf": "",
        "pacmanbin": "pacman",
        "pacmanconf": "/etc/pacman.conf",
        "tarbin": "bsdtar",
        "redownload": "no",
        "rebuild": "no",
        "batchinstall": false,
        "answerclean": "",
        "answerdiff": "",
        "answeredit": "",
        "answerupgrade": "",
        "gitbin": "git",
        "gpgbin": "gpg",
        "gpgflags": "",
        "mflags": "",
        "sortby": "votes",
        "searchby": "name-desc",
        "gitflags": "",
        "removemake": "ask",
        "requestsplitn": 150,
        "sortmode": 0,
        "completionrefreshtime": 7,
        "sudoloop": false,
        "timeupdate": false,
        "devel": false,
        "cleanAfter": false,
        "gitclone": true,
        "provides": true,
        "pgpfetch": true,
        "upgrademenu": true,
        "cleanmenu": true,
        "diffmenu": true,
        "editmenu": false,
        "combinedupgrade": false,
        "useask": false
}

```
