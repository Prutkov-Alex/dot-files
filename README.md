# dot-files
My dotfiles and supplementary config folders for Zsh, vim, tmux,
colortheme and other configurations I am used to.

==Steps==
1. Run ./deploy.sh script. It will ask for sudo password if needed
2. Layout settings are not deployed automatically. To make changes manually:
	2.1. Diff the 'ru' file with one located at '/usr/share/X11/xkb/symbols/ru'
		 and make sure you are satisfied with the changes.
	2.2. Add 'Russian(Phonetic)' layout via 'Settings', or take a look at
		 'dconf dump "/org/gnome/desktop/input-sources/"' in case you are with headless setup.
3. To disable annoying horizontal scroll mouse buttons, put 
	'50-logitech-disable-horiz-scroll.conf ' file into '/usr/share/X11/xorg.conf.d/' folder. 
	Adjust your mouse name identifier, use 'xinput list' for that.
	Restart Xserver. 
