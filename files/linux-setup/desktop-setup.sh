echo "========== STARTING DESKTOP INSTALLATION AND SETUP... =========="
echo ""
echo "STARTING DESKTOP INSTALLATION..."

# pacman software
sudo pacman -S dunst lightdm lightdm-gtk-greeter arc-gtk-theme xorg bspwm sxhkd polybar picom rofi flameshot

echo "...FINISHED DESKTOP INSTALLATION"
echo ""
echo "STARTING DESKTOP SETUP..."

# lightdm setup
sudo systemctl enable lightdm

# add config folder
mkdir ~/.config/

# add config files
mkdir     ~/.config/alacritty/
curl -o   ~/.config/alacritty/alacritty.yml https://godalming123.github.io/blog/files/linux-setup/configs/alacritty.yml

mkdir     ~/.config/bspwm/
curl -o   ~/.config/bspwm/bspwmrc           https://godalming123.github.io/blog/files/linux-setup/configs/bspwmrc
chmod a+x ~/.config/bspwm/bspwmrc

mkdir     ~/.screenlayout/
curl -o   ~/.screenlayout/workstation.sh    https://godalming123.github.io/blog/files/linux-setup/configs/screenlayout.sh
chmod a+x ~/.screenlayout/workstation.sh

mkdir     ~/.config/sxhkd/
curl -o   ~/.config/sxhkd/sxhkdrc           https://godalming123.github.io/blog/files/linux-setup/configs/sxhkdrc

mkdir     ~/.config/picom/
curl -o   ~/.config/picom/picom.conf        https://godalming123.github.io/blog/files/linux-setup/configs/picom.conf

mkdir     ~/.config/polybar/
curl -o   ~/.config/polybar/launch.sh       https://godalming123.github.io/blog/files/linux-setup/configs/polybar-launch.sh
chmod a+x ~/.config/polybar/launch.sh

curl -o   ~/.config/polybar/config          https://godalming123.github.io/blog/files/linux-setup/configs/polybar-config

mkdir     ~/.config/rofi/
curl -o   ~/.config/rofi/config.rasi        https://godalming123.github.io/blog/files/linux-setup/configs/rofi-config.rasi
echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="