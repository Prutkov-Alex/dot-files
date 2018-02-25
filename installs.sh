#!/bin/bash

#if ! [ $(id -u) = 0 ]; then
#	echo "This script must have root privileges for installing packages."
#	echo "Please rerun with sudo"
#	exit 1
#fi

sudo apt-get install -y vim tmux powerline zsh 
