#!/bin/bash
backup(){
    bkp_fold="backups/$(date +"%d-%m-%y_%H:%M")"
    mkdir -p "$bkp_fold"
    cp -rf "$HOME"/.config/polybar "$bkp_fold"
    cp -rf "$HOME"/.config/i3 "$bkp_fold"
    cp -rf "$HOME"/.config/rofi "$bkp_fold"
    cp -rf "$HOME"/.config/gtk-3.0/settings.ini "$bkp_fold"
}

backup
cp -rf conf/polybar/* "$HOME"/.config/polybar
cp -rf conf/i3/* "$HOME"/.config/i3
cp -rf conf/rofi/* "$HOME"/.config/rofi
cp -f conf/settings.ini "$HOME"/.config/gtk-3.0/settings.ini