#! /bin/bash

mkdir ~/Programs ~/.config
cd ~/dotfiles
pwd
mv ./bin ~/bin

sudo pacman -Syu
sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel vim
sudo pacman -S --needed gcc base-devel
sudo pacman -S cmake unzip ripgrep fd cowsay fortune-mod

# paru
cd ~/Programs
pwd
git clone https://aur.archlinux.org/paru.git
cd ~/Programs/paru-git
pwd
makepkg -sfi

# picom ibhagwan
paru -S picom-ibhagwan-git
cd ~/dotfiles
ln -sf ./config/picom ~/.config/picom

# lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo systemctl enable lightdm.service
cd ~/dotfiles
sudo cp ./lightdm.conf /etc/lightdm/lightdm.conf

# qtile
sudo pacman -S qtile
cd ~/dotfiles
ln ./config/qtile ~/.config/qtile

# alacritty
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb rustup gzip
cd ~/Programs
pwd
git clone https://github.com/alacritty/alacritty
cd ~/Programs/alacritty
pwd
sleep 1
rustup override set stable
sleep 1
rustup update stable
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
mkdir -p $fish_complete_path[1]
cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish
cd ~/dotfiles
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
cd ~/dotfiles
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
cd ~/dotfiles
ln -sf ./config/nvim ~/.config/nvim

#flutter
paru -S android-studio
paru -S vscodium-bin

# starship
curl -fsSL https://starship.rs/install.sh | bash
cd ~/dotfiles
ln -sf ./.bashrc ~/.bashrc
