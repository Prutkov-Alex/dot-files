#!/bin/bash

if ! [ $(id -u) = 0 ]; then
	echo "This script must have root privileges for installing packages."
	echo "Please rerun with sudo"
	exit 1
fi

#apt-get install vim tmux powerline zsh 

echo "Successfully installed packages for $SUDO_USER"

HOMEDIR="/home/$SUDO_USER/"

BackupAndSymlink () {
	if [ -f $1 -o -d $1 ]; then
		echo "Backing up $1 to $1.bak..."
		echo "Generating symlink $1 -> $2"
	fi
}

BackupAndSymlink "/home/user/.vim" "bcd" 

if [ -d $HOMEDIR/.vim ]; then
	echo "$HOMEDIR/.vim found"
	# mv $HOMEDIR/.vim $HOMEDIR/.vim.bak
fi
exit 0
