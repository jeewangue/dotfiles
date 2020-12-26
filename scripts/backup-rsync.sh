#! /bin/bash

BACKUP_DIR=/nas/data/backup/asus-20201119
LOG_DIR=/nas/data/logs

# backup /etc
sudo rsync \
	-auvhpHAXS \
	--partial --delete --info=progress2 \
	--partial-dir=.rsync-partial \
	--log-file="${LOG_DIR}/$(date +%F-%H:%M:%S)-rsync.log" \
	/etc/ "${BACKUP_DIR}/etc"

# backup /home
sudo rsync \
	-auvhpHAXS \
	--partial --info=progress2 \
	--partial-dir=.rsync-partial \
	--exclude=Dropbox \
	--exclude=node_modules \
	--exclude=".stack" \
	--exclude=".vagrant.d" \
	--exclude=".cache" \
	--exclude=".vim" \
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
	--exclude=".CLion2019.3" \
	--exclude=".hoogle" \
	--exclude=".garden" \
	--exclude=".nvm" \
	--exclude=".RubyMine2019.3" \
	--exclude=".dotnet" \
	--exclude=".gphotos-cdp" \
	--exclude=".wine" \
	--exclude=".azure" \
	--exclude=".bundle" \
	--exclude=".yarn" \
	--exclude=dist \
	--exclude=cache \
	--exclude=Cache \
	--exclude=build \
	--exclude=Build \
	--exclude=AURs \
	--exclude=AURs-yay \
	--exclude="/home/jeewangue/go" \
	--exclude="/home/jeewangue/mail" \
	--exclude="/home/jeewangue/GPUCache" \
	--exclude="VirtualBox VMs" \
	--log-file="${LOG_DIR}/$(date +%F-%H:%M:%S)-rsync.log" \
	"${HOME}/" "${BACKUP_DIR}/home"

