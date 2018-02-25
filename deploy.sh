#!/bin/bash

if ! [ $(id -u) != 0 ]; then
	echo "This script must NOT have root privileges."
	echo "I will ask for root password if needed"
	exit 1
fi

bash ./installs.sh

echo "Successfully installed packages for $SUDO_USER"

ROOTDIR=$(pwd)

BackupAndSymlink () {
	if [ -f $1 -o -d $1 ]; then
		echo "Backing up $1..."
		mv $1 ~/.conf.bak/
	else
		echo "Path $1 does not exist"
	fi

	echo "Generating symlink $1 -> $2"
	ln -s $2 $1
}

if ! [ -d ~/.conf.bak ]; then
	echo "Creating ~/.conf.bak for backups"
fi

BackupAndSymlink "~/.vim" "$ROOTDIR/.vim"
BackupAndSymlink "~/.vimrc" "$ROOTDIR/.vimrc"
BackupAndSymlink "~/.oh-my-zsh" "$ROOTDIR/.oh-my-zsh"
BackupAndSymlink "~/.zshrc" "$ROOTDIR/.zshrc"
BackupAndSymlink "~/.tmux.conf" "$ROOTDIR/.tmux.conf"

exit 0
