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

# add config files
curl -o ~/.config/alacritty/alacritty.yml https://godalming123.github.io/blog/files/linux-setup/configs/alacritty.yml
curl -o ~/.config/bspwm/bspwmrc           https://godalming123.github.io/blog/files/linux-setup/configs/bspwmrc
curl -o ~/.screenlayout/workstation.sh    https://godalming123.github.io/blog/files/linux-setup/configs/screenlayout.sh
curl -o ~/.config/sxhkd/sxhkdrc           https://godalming123.github.io/blog/files/linux-setup/configs/sxhkdrc
curl -o ~/.config/picom/picom.conf        https://godalming123.github.io/blog/files/linux-setup/configs/picom.conf
curl -o ~/.config/polybar/launch.sh       https://godalming123.github.io/blog/files/linux-setup/configs/polybar-launch.sh
curl -o ~/.config/polybar/config          https://godalming123.github.io/blog/files/linux-setup/configs/polybar-config
curl -o ~/.config/rofi/config.rasi        https://godalming123.github.io/blog/files/linux-setup/configs/rofi-config.rasi
echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="