#! /bin/bash

sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel vim
sudo pacman -S base-devel cmake unzip

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo vim -c "norm102G0xf=lClightdm-gtk-greeter" \
  -c "norm107G0xf=lCqtile"

mkdir ~/Programs ~/.config
mv ./bin ~/bin -r
# yay
cd ~/Programs
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ~

# Neovim
cd ~/Programs
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
ln -sf ./config/nvim ~/.config/nvim

