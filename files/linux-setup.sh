sudo pacman -S git nano alacritty gnome-boxes nautilus firefox neofetch xsercurelock lightdm lightdm-gtk-greeter arc-gtk-theme xorg bspwm sxhkd polybar picom rofi

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rmdir paru/

paru -S vscodium-bin btop jekyll github-desktop-bin teams discord-development

sudo systemctl enable lightdm

touch ~/.config/bspwm/baspwmrc
touch ~/.screenlayout/workstation.sh
touch ~/.config/sxhkd/sxhkdrc
touch ~/.config/picom/picom.conf
touch ~/.config/polybar/launch.sh
touch ~/.config/polybar/config
touch ~/.config/rofi/config.rasi



echo "========================================================"

echo "========================================================"
echo "INSTALL FINISHED"
echo "========================================================"

echo "Now you must install icon fonts for polybar as instructed in https://godalming123.github.io/blog/tuturiols/2021-10-21-my-linux-setup.html#polybar. You should also edit the configs as shown in https://godalming123.github.io/blog/tuturiols/2021-10-21-my-linux-setup.html"

echo "========================================================"
echo "========================================================"