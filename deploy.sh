#!/bin/bash
set -e

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

GenProfile () {
	echo "Adding solarized-dark theme to terminal profiles..."
	UUID=$(uuidgen)
	echo "Generated UUID: $UUID"
	cat profile.dconf | dconf load "/org/gnome/terminal/legacy/profiles:/:$UUID/"
	#NEWLIST=$(dconf read "/org/gnome/terminal/legacy/profiles:/list" | sed "s/\]/\,\ \'$UUID\'\]/")
	#echo $NEWLIST
	dconf write "/org/gnome/terminal/legacy/profiles:/list" "['$UUID']"
	#dconf write "/org/gnome/terminal/legacy/profiles:/list" "$NEWLIST"
	dconf write "/org/gnome/terminal/legacy/profiles:/default" "'$UUID'"
}

if ! [ $(id -u) != 0 ]; then
	echo "This script must NOT have root privileges."
	echo "I will ask for root password if needed"
	exit 1
fi

git submodule update --init

bash ./installs.sh

echo "Successfully installed packages for $SUDO_USER"

ROOTDIR=$(pwd)
if ! [ -d $HOME/.conf.bak ]; then
	echo "Creating $HOME/.conf.bak for backups"
	mkdir $HOME/.conf.bak
fi

BackupAndSymlink "$HOME/.vim" "$ROOTDIR/.vim"
BackupAndSymlink "$HOME/.vimrc" "$ROOTDIR/.vimrc"
BackupAndSymlink "$HOME/.oh-my-zsh" "$ROOTDIR/.oh-my-zsh"
BackupAndSymlink "$HOME/.zshrc" "$ROOTDIR/.zshrc"
BackupAndSymlink "$HOME/.tmux.conf" "$ROOTDIR/.tmux.conf"

echo "Change default shell to zsh..."
chsh -s /bin/zsh

GenProfile

echo "Logging out to apply changes"
gnome-session-quit --logout
exit 0
