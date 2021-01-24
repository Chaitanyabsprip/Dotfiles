#! /bin/bash

mkdir ~/Programs ~/.config
mv ./bin ~/bin -r

sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel vim
sudo pacman -S base-devel cmake unzip ripgrep fd

# yay
cd ~/Programs
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ~

# picom ibhagwan
sudo yay -S picom-ibhagwan-git
ln -s ./config/picom ~/.config/picom

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo ln -s ./lightdm.conf /etc/lightdm/lightdm.conf

# qtile
sudo pacman -S qtile
ln ./config/qtile ~/.config/qtile

# alacritty
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb rustup gzip
rustup override set stable
rustup update stable
cd ~/Programs
git clone https://github.com/alacritty/alacritty
cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

mkdir -p $fish_complete_path[1]
cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish

# vimb
sudo pacman -S vimb

# rofi
sudo pacman -S xcb-util-xrm check libxkbcommon-x11 startup-notification
git clone --recursive https://github.com/DaveDavenport/rofi
cd rofi/
autoreconf -i
mkdir build && cd build
../configure
make
sudo make install

# Neovim
cd ~/Programs
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
ln -sf ./config/nvim ~/.config/nvim

