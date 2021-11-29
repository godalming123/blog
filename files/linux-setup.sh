# update
sudo pacman -Syu

# pacman software
sudo pacman -S git discord micro alacritty gnome-boxes nautilus firefox neofetch xsercurelock lightdm lightdm-gtk-greeter arc-gtk-theme xorg bspwm sxhkd polybar picom rofi

# paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rmdir paru/

# paru software
paru -S vscodium-bin btop jekyll github-desktop-bin teams

# lightdm setup
sudo systemctl enable lightdm

# add config files
touch ~/.config/bspwm/bspwmrc
touch ~/.screenlayout/workstation.sh
touch ~/.config/sxhkd/sxhkdrc
touch ~/.config/picom/picom.conf
touch ~/.config/polybar/launch.sh
touch ~/.config/polybar/config
touch ~/.config/rofi/config.rasi



echo "========================================================"
echo "========================================================"
echo ""
echo "========================================================"
echo "INSTALL FINISHED"
echo "========================================================"
echo ""
echo "Now you must install icon fonts for polybar as instructed in https://godalming123.github.io/blog/tuturiols/2021-10-21-my-linux-setup.html#polybar. You should also edit the configs as shown in https://godalming123.github.io/blog/tuturiols/2021-10-21-my-linux-setup.html"
echo ""
echo "========================================================"
echo "========================================================"