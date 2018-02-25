#!/bin/bash

if ! [ $(id -u) = 0 ]; then
	echo "This script must have root privileges for installing packages."
	echo "Please rerun with sudo"
	exit 1
fi

#apt-get install vim tmux powerline zsh 

echo "Successfully installed packages for $SUDO_USER"

HOMEDIR="/home/$SUDO_USER/"
ROOTDIR=$(cwd)

BackupAndSymlink () {
	if [ -f $1 -o -d $1 ]; then
		echo "Backing up $1..."
		mv $1 $ROOTDIR/
	else
		echo "Path $1 does not exist"
	fi

	echo "Generating symlink $1 -> $2"
	ln -s $2 $1
}

if ! [ -d $HOMEDIR/.conf.bak ]; then
	echo "Creating $HOMEDIR/.conf.bak for backups"
fi

BackupAndSymlink "$HOMEDIR/.vim" "$ROOTDIR/.vim"
BackupAndSymlink "$HOMEDIR/.vimrc" "$ROOTDIR/.vimrc"
BackupAndSymlink "$HOMEDIR/.oh-my-zsh" "$ROOTDIR/.oh-my-zsh"
BackupAndSymlink "$HOMEDIR/.zshrc" "$ROOTDIR/.zshrc"
BackupAndSymlink "$HOMEDIR/.tmux.conf" "$ROOTDIR/.tmux.conf"

exit 0
