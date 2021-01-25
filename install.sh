#! /bin/bash

mkdir ~/Programs ~/.config
mv ./bin ~/bin

sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel vim
sudo pacman -S gcc build-essential
sudo pacman -S base-devel cmake unzip ripgrep fd cowsay fortune

# yay
cd ~/Programs
pwd
git clone https://aur.archlinux.org/yay-git.git
cd ~/Programs/yay-git
pwd
makepkg -sfi

# picom ibhagwan
yay -S picom-ibhagwan-git
ln -sf ./config/picom ~/.config/picom

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo ln -sf ./lightdm.conf /etc/lightdm/lightdm.conf

# qtile
sudo pacman -S qtile
ln ./config/qtile ~/.config/qtile

# alacritty
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb rustup gzip
rustup override set stable
rustup update stable
cd ~/Programs
pwd
git clone https://github.com/alacritty/alacritty
cd ~/Programs/alacritty
pwd
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
mkdir -p $fish_complete_path[1]
cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish
ln -sf ./config/alacritty ~/.config/alacritty

# vimb
sudo pacman -S vimb

# rofi
sudo pacman -S xcb-util-xrm check libxkbcommon-x11 startup-notification
cd ~/Programs
pwd
git clone --recursive https://github.com/DaveDavenport/rofi
cd ~/Programs/rofi/
pwd
autoreconf -i
mkdir build && cd build
../configure
make
sudo make install
ln -sf ./config/rofi ~/.config/rofi
ln -sf ./config/rofi.old ~/.config/rofi.old

# Neovim
cd ~/Programs
pwd
git clone https://github.com/neovim/neovim
cd ~/Programs/neovim
pwd
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
ln -sf ./config/nvim ~/.config/nvim

#flutter
yay -S android-sftudio
yay -S vscodium-bin

# starship
curl -fsSL https://starship.rs/install.sh | bash
ln -s ./.bashrc ~/.bashrc
