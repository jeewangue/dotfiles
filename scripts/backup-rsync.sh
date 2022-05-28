#! /bin/bash

BACKUP_DIR=jeewangue@192.168.83.117:/volume1/data/backup/asus-20220528

# backup /home
sudo rsync \
	-auHXS \
	-hh \
	--partial \
	--stats \
	--info=progress2 \
	--delete \
	--exclude=Dropbox \
	--exclude=node_modules \
	--exclude=".stack" \
	--exclude=".vagrant.d" \
	--exclude=".cache" \
	--exclude=".rvm" \
	--exclude=".meteor" \
	--exclude=".dropbox" \
	--exclude=".npm" \
	--exclude=".wine32" \
	--exclude=".vscode-oss" \
	--exclude=".vscode" \
	--exclude=".p2" \
	--exclude=".RFCs" \
	--exclude=".pyenv" \
	--exclude=".nvm" \
	--exclude=".dotnet" \
	--exclude=".gphotos-cdp" \
	--exclude=".wine" \
	--exclude=".azure" \
	--exclude=".bundle" \
	--exclude=".yarn" \
	--exclude=dist \
	--exclude=cache \
	--exclude=Cache \
	--exclude=GPUCache \
	--exclude=build \
	--exclude=Build \
	--exclude=AUR \
	--exclude="VirtualBox VMs" \
	--include="/etc" \
	--include="/etc/**" \
	--include="/var" \
	--include="/var/log" \
	--include="/var/log/**" \
	--include="/home" \
	--include="/home/**" \
	--exclude="*" \
	/ "${BACKUP_DIR}"

