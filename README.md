# dotfiles
dotfiles arch linux+i3 configuration

*most important scripts*

battery script - hibernate system when battery is low

for everything works fine 
----------


    sudo pacman -S polkit dunst network-manager-applet &&\
    yaourt playerctl &&
    yaourt pulseaudio-ctl
	
	for enable i3lock when lid is closed you need copy suspend@.service file to /etc/systemd/system/
	
	for enable systemctl enable suspend@username.service
![desktop](http://i.imgur.com/fOWoVzT.png)
