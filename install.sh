#! /bin/bash

echo "---------------------------Creating Folders------------------------------"
mkdir ~/Programs ~/.config
cd ~/dotfiles
pwd
echo "---------------------------Moving bin Folder-----------------------------"
mv ./bin ~/

echo "---------------------------Updating System-------------------------------"
sudo pacman -Syu
echo "----------------------------Installing Packages--------------------------"
sudo pacman -S xorg xorg-xinit nitrogen firefox xf86-video-intel vim cmake\
  unzip ripgrep fd cowsay fortune freetype2 fontconfig pkg-config make libxcb\
  gzip lightdm lightdm-gtk-greeter qtile vimb xcb-util-xrm check\
  libxkbcommon-x11 startup-notification pcmanfm networkmanager htop
echo "------------------------Installing gcc and base-devel--------------------"
sudo pacman -S --needed gcc base-devel

# paru
echo "---------------------------Installing paru-------------------------------"
cd ~/Programs
pwd
git clone https://aur.archlinux.org/paru.git
cd ~/Programs/paru
pwd
rustup override set stable
rustup update stable
makepkg -sfi

# picom ibhagwan
echo "---------------------------Installing picom-ibhagwan---------------------"
paru -S picom-ibhagwan-git
cd ~/dotfiles
ln -sf ~/dotfiles/config/picom ~/.config/picom

# lightdm
echo "---------------------------Installing lightdm----------------------------"
sudo systemctl enable lightdm
sudo systemctl enable lightdm.service
cd ~/dotfiles
sudo cp ./lightdm.conf /etc/lightdm/lightdm.conf

# qtile
echo "---------------------------Installing qtile------------------------------"
cd ~/dotfiles
ln -sf ~/dotfiles/config/qtile ~/.config/qtile

# alacritty
echo "---------------------------Installing alacritty--------------------------"
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
ln -sf ~/dotfiles/config/alacritty ~/.config/alacritty

# rofi
echo "---------------------------Installing rofi-------------------------------"
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
ln -sf ~/dotfiles/config/rofi ~/.config/rofi
ln -sf ~/dotfiles/config/rofi.old ~/.config/rofi.old

# Neovim
echo "---------------------------Installing neovim-----------------------------"
cd ~/Programs
pwd
git clone https://github.com/neovim/neovim
cd ~/Programs/neovim
pwd
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~/dotfiles
ln -sf ~/dotfiles/config/nvim ~/.config/nvim

#flutter
echo "--------------------Installing android studio and vscode-----------------"
paru -S android-studio
paru -S vscodium-bin

# starship
echo "---------------------------Installing startship--------------------------"
curl -fsSL https://starship.rs/install.sh | bash
cd ~/dotfiles
ln -sf ~/dotfiles/.bashrc ~/.bashrc
