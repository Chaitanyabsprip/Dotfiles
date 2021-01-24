#! /bin/bash

sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel git

mkdir ~/Programs

# yay
cd ~/Programs
sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ~

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm

cd ~/Programs
git clone https://github.com/neovim/neovim
cd neovim
make install
sudo make install
