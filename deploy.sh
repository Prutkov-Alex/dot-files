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
		mv $1 $HOME/.conf.bak/
	else
		echo "Path $1 does not exist"
	fi

	echo "Generating symlink $1 -> $2"
	ln -s "$2" "$1"
}

if ! [ -d $HOME/.conf.bak ]; then
	echo "Creating $HOME/.conf.bak for backups"
	mkdir $HOME/.conf.bak
fi

BackupAndSymlink "$HOME/.vim" "$ROOTDIR/.vim"
BackupAndSymlink "$HOME/.vimrc" "$ROOTDIR/.vimrc"
BackupAndSymlink "$HOME/.oh-my-zsh" "$ROOTDIR/.oh-my-zsh"
BackupAndSymlink "$HOME/.zshrc" "$ROOTDIR/.zshrc"
BackupAndSymlink "$HOME/.tmux.conf" "$ROOTDIR/.tmux.conf"

exit 0
