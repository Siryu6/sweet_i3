#!/bin/bash

hostname=$(hostname)
user=$(whoami)

# Install needed componnents
printf "Installing i3 on %s\n" "$hostname"
pikaur -Sy i3-gaps i3ipc-glib-git polybar network-manager-applet nitrogen rofi lightdm lightdm-webkit2-greeter kitty python-pip pulseaudio pulseaudio-alsa
pip install dbus-python --user

# Adding user in audio group
sudo usermod -aG audio "$user"

# enable and conf lightdm
sudo cp -f conf/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp -f conf/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
systemctl enable lightdm

# Installing fonts and theme
pikaur -Sy noto-fonts ttf-font-awesome terminus-font ttf-material-design-icons flat-remix arc-gtk-theme

mkdir "$HOME"/.config/{polybar,i3,rofi,gtk-3.0}
cp -rf conf/polybar/* "$HOME"/.config/polybar
cp -rf conf/i3/* "$HOME"/.config/i3
cp -rf conf/rofi/* "$HOME"/.config/rofi
cp -f conf/settings.ini "$HOME"/.config/gtk-3.0/settings.ini

# Background
sudo cp images/wp-black.jpg /usr/share/backgrounds/
nitrogen --set-centered /usr/share/backgrounds/wp-black.jpg


## TODO
# lightdm theme

