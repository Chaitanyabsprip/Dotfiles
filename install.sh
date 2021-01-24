#! /bin/bash

sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel vim
sudo pacman -S base-devel cmake unzip

# yay
cd ~/Programs
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ~

# picom ibhagwan
sudo yay -S picom-ibhagwan-git

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo ln -s ./lightdm.conf /etc/lightdm/lightdm.conf

mkdir ~/Programs ~/.config
mv ./bin ~/bin -r

# Neovim
cd ~/Programs
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
ln -sf ./config/nvim ~/.config/nvim

