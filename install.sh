#! /bin/bash

mkdir ~/Programs

# yay
cd Programs
sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ~

sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
