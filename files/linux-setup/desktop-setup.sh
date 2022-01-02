#! /bin/sh

echo "=======STARTING DESKTOP INSTALLATION AND SETUP V1.6.0 ... ======"
echo ""
echo "STARTING DESKTOP INSTALLATION..."

# pacman software
sudo pacman -S blueberry volumeicon pipewire pipewire-alsa pipewire-jack pipewire-pulse dunst lightdm lightdm-gtk-greeter arc-gtk-theme xorg bspwm sxhkd polybar picom rofi flameshot fish

echo "...FINISHED DESKTOP INSTALLATION"
echo ""
echo "STARTING DESKTOP SETUP..."

# icons in the terminal
# git clone https://github.com/sebastiencs/icons-in-terminal.git
# cd icons-in-terminal
# bash install-autodetect.sh
# cd ../

# icons in ls menu
# sudo pacman -S wget
# git clone https://github.com/sebastiencs/ls-icons.git
# ./bootstrap
# export CFLAGS=-DNO_TRUE_COLOURS=1 # Execute this line _only_ if your terminal doesn't support true colours
# export CC=clang CXX=clang++
# ./configure --prefix=/opt/coreutils
# make
# make install
# /opt/coreutils/bin/ls
# cd ../

#change shell
chsh -s /bin/fish $USER

# add config folder
mkdir ~/.config/

# add config files
sudo mkdir     /etc/lightdm
sudo curl -o   /etc/lightdm/lightdm.conf                       https://godalming123.github.io/blog/files/linux-setup/configs/lightdm.conf
sudo curl -o   /etc/lightdm/lightdm-gtk-greeter.conf           https://godalming123.github.io/blog/files/linux-setup/configs/lightdm-gtk-greeter.conf

sudo mkdir     /usr/share/backgrounds/
sudo mkdir     /usr/share/backgrounds/bspwm/
sudo curl -o   /usr/share/backgrounds/bspwm/windows.jpg           https://godalming123.github.io/blog/files/linux-setup/configs/wallpapers/windows.jpg
sudo curl -o   /usr/share/backgrounds/bspwm/detailed-mountain.jpg https://godalming123.github.io/blog/files/linux-setup/configs/wallpapers/detailed-mountain.jpg
sudo curl -o   /usr/share/backgrounds/bspwm/simple-mountain.jpg   https://godalming123.github.io/blog/files/linux-setup/configs/wallpapers/simple-mountain.jpg

curl -o        ~/.config/fish/config.fish          https://godalming123.github.io/blog/files/linux-setup/configs/config.fish

sudo curl -o   /bin/ufetch-arch.sh                 https://godalming123.github.io/blog/files/linux-setup/configs/ufetch-arch.sh
sudo chmod a+x /bin/ufetch-arch.sh

mkdir          ~/.config/alacritty/
curl -o        ~/.config/alacritty/alacritty.yml   https://godalming123.github.io/blog/files/linux-setup/configs/alacritty.yml

mkdir          ~/.config/bspwm/
curl -o        ~/.config/bspwm/bspwmrc             https://godalming123.github.io/blog/files/linux-setup/configs/bspwmrc
chmod a+x      ~/.config/bspwm/bspwmrc

sudo mkdir     /usr/share/screenlayouts/
sudo curl -o   /usr/share/screenlayouts/primary.sh https://godalming123.github.io/blog/files/linux-setup/configs/screenlayout.sh
sudo chmod a+x /usr/share/screenlayouts/primary.sh

mkdir          ~/.config/sxhkd/
curl -o        ~/.config/sxhkd/sxhkdrc             https://godalming123.github.io/blog/files/linux-setup/configs/sxhkdrc

mkdir          ~/.config/picom/
curl -o        ~/.config/picom/picom.conf          https://godalming123.github.io/blog/files/linux-setup/configs/picom.conf

mkdir          ~/.config/polybar/
curl -o        ~/.config/polybar/launch.sh         https://godalming123.github.io/blog/files/linux-setup/configs/polybar-launch.sh
chmod a+x      ~/.config/polybar/launch.sh

curl -o        ~/.config/polybar/config            https://godalming123.github.io/blog/files/linux-setup/configs/polybar-config

mkdir          ~/.config/rofi/
curl -o        ~/.config/rofi/config.rasi          https://godalming123.github.io/blog/files/linux-setup/configs/rofi-config.rasi

sudo mkdir     /usr/share/fonts/TTF/
sudo curl -o   /usr/share/fonts/TTF/Material-Design-Iconic-Font.ttf https://godalming123.github.io/blog/files/linux-setup/configs/Material-Design-Iconic-Font.ttf

echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="

# lightdm setup
sudo systemctl enable lightdm --now