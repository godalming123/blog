echo "================================================================"
echo "===================== STARTING UPGRADES... ====================="
echo "================================================================"
sudo pacman -Syu
echo "================================================================"
echo "===================== ...FINISHED UPGRADES ====================="
echo "================================================================"
echo ""
echo "================================================================"
echo "==== STARTING INSTALLATION AND CONFIIGURATION OF SYSTEM... ====="
echo "================================================================"
echo ""
wget https://godalming123.github.io/blog/files/linux-setup/software-sources.sh
chmod a+x software-sources.sh
bash software-sources.sh
echo ""
wget https://godalming123.github.io/blog/files/linux-setup/desktop-setup.sh
chmod a+x software-sources.sh
bash desktop-setup.sh
echo ""
wget https://godalming123.github.io/blog/files/linux-setup/software-basic.sh
chmod a+x software-basic.sh
bash software-basic.sh
echo ""
wget https://godalming123.github.io/blog/files/linux-setup/software-extra.sh
chmod a+x software-extra.sh
bash software-extra.sh
echo "================================================================"
echo "==== ...FINISHED INSTALLATION AND CONFIIGURATION OF SYSTEM ====="
echo "================================================================"