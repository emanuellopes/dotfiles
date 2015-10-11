# dotfiles
dotfiles arch linux+i3 configuration

*most important scripts*

battery script - hibernate system when battery is low

for everything work fine 
----------


    sudo pacman -S polkit dunst network-manager-applet &&\
    yaourt playerctl &&
    yaourt pulseaudio-ctl
	
	to enable i3lock when lid is closed you need to copy suspend@.service file to /etc/systemd/system/
	
	systemctl enable suspend@username.service
![desktop](http://i.imgur.com/fOWoVzT.png)
