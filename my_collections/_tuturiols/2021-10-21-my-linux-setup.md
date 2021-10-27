---
layout: post
author: Me
title: My linux setup
tags: linux bspwm arch picom sxhkd polybar
type: "tuturiol"
front-image: ""
barba-page-namespace: post
---

## Screenshots
These are some screenshots of my setup:

## 1. Distro
Currently I use Endevour but I plan to install arch next time I install a distro I just tried endeavour to try arch witout the installation hastle. And I loved it ❤️️! I could find any packadge I wanted with yay and pacman, it was fluid and performant, it was customizable and vanialla and the list goes on. ...and on ...and on ...FOREVER.

## 2. Software
### 1. Yay
I use yay as an aur helper and its what makes arch great anyway just run:
```
git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si
```
Finally we must remove the yay-git directory
```
cd ../
rmdir yay-git/
```
### 2. vscodium
```yay -S vscodium-bin```
### 3. btop++
```yay -S btop```
### 4. firefox
```pacman -S firefox```
### 5. github-desktop
#### Installation
```yay -S github-desktop-bin```
#### Configuration
1. press ctrl + , on your keyboard
### 6. temas
```yay -S teams```
### 7. discord
```yay -S discord-development```

## 2. Wm
I use bspwm + sxhkd + polybar + picom + rofi for my gui setup.
### Installation
Just run
```pacman -S xorg bspwm sxhkd polybar picom rofi```
### Configuration
