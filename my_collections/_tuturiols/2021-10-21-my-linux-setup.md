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
```
yay -S vscodium-bin
```
### 3. btop++
```
yay -S btop
```
### 4. jekyll + ruby
```
yay -S jekyll
```

### 4. firefox
```
pacman -S firefox
```
### 5. github-desktop
#### Installation
```
yay -S github-desktop-bin
```
#### Configuration
1. press ctrl + , on your keyboard

### 6. teams
```yay -S teams```
### 7. discord
```yay -S discord-development```

## 2. Wm
I use bspwm + sxhkd + polybar + picom + rofi for my gui setup.
### Installation
Just run
```pacman -S xorg bspwm sxhkd polybar picom rofi```
### Configuration
#### 1. bspwm
##### Config
My bspwm config is:
```
~/.config/bspwm/baspwmrc
```
```
#! /bin/sh

# =========================================================
# startup
# =========================================================

bash ~/.screenlayout/workstation.sh

picom -f &
pgrep -x sxhkd > /dev/null || sxhkd &
bash ~/.config/polybar/launch.sh &
bspc monitor HDMI-1 -d 1 2 3 4 5
bspc monitor eDP-1 -d 6 7 8 9 10

# =========================================================
# options
# =========================================================

bspc config border_width        0
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off

```
For this file to work we need to add `~/.screenlayout/workstation.sh` what this file does is sets up my laptop so the external moniter I have plugged in is set as a primary moniter and her is the file contents:
```
~/.screenlayout/workstation.sh
```
```
#!/bin/sh
xrandr --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal
```
Next we need to setup our sxhkd config I generally do not like have hotkeys directly linking to app like `super` + `w` = `browser` instead I prefer to use rofi to do that the only binding I have to an app is `super` + `enter` = `terminal` which is just because the number of times I'm following a guide and have to open the terminal is crazy. I also believe that keys should be bound to somethink that is easily accessible. EG: `super` + `l` for left, `r` for right, `u` for up and `d` for down is not accesble as you have to do hand gymnastics to change window focus even if those keybindings are easy to learn becuase the letter stands for something. Instead I believe in keybindings being quik all my keybinds are center around `super` + `wasd` this is my keybinding for changing window focus and `super` + `shift` + `wasd` would move windows and `super` + `q` would kill and `super` + `e` would open rofi with all my keybindings being easily accesuble form one hand whil the other can be using the mouse or typing. Anyways this is my config:
```
~/.config/sxhkd/sxhkdrc
```
```
#
# To learn more about how to configure Polybar
# go to https://github.com/polybar/polybar
#
# The README contains a lot of information
#

#1. Wm independent hotkeys
	#1. terminal
	#2. launcher
	#3. screenshots
	#4. relead sxhkd
	#5. lock screen and sleep

#2. Bspwm hotkeys
	#1. General
		#1. Quit bspwm to login screen
		#2. close window
		#3. Alternate between tiled and monocule layout
		#4. send the newest marked node to the newest preselected node
		#5. swap the current node and the biggest window
	#2. State/flags
		#1. Set window state
		#2. Set the node flags
	#3. Focus/swap
		#1. move focus in given direction
		#2. focus the node for the given path jump
		#3. next/previous desktop in current moniter
		#4. focus the last node/desktop
		#5. focus the older or newer node in the focus history
		#6. focus or send to the given desktop
	#4. Preselect
		#1. preselect the direction
		#2. preselect the ratio
		#3. cancel the preselection for the focused node
		#4. cancel the preselection for the focused desktop
	#5. Move/resize
		#1. expand a window by moving one of its side outward
		#2. contract a window by moving one of its side inward
		#3. move a floating window

# ---------------------------
# 1. wm independent hotkeys
# ---------------------------

# 1. 1. terminal emulator --------
super + Return
	termite

# 1. 2. program launcher --------
super + e
	rofi -show run

# 1. 3. screenshots -------------
super + p # full
    scrot 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/screenshots && mv $f ~/screenshots && xclip -selection clipboard -t image/png -i ~/screenshots/`ls -1 -t ~/screenshots | head -1`'
super + shift + p # selection
    scrot -s 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/screenshots && mv $f ~/screenshots && xclip -selection clipboard -t image/png -i ~/screenshots/`ls -1 -t ~/screenshots | head -1`'

# 1. 4. sxhkd relead --------
super + Escape
	pkill -USR1 -x sxhkd

# 1. 5. lock screen and sleep ----
super + x
	env XSECURELOCK_DISCARD_FIRST_KEYPRESS=0 xsecurelock & systemctl suspend

# -----------------------
# 2. bspwm hotkeys
# -----------------------

#
# 2. 1. general ------------
#

# 2. 1. 1. quit/restart bspwm ------
super + shift + e
	bspc {quit,wm -r}

# 2. 1. 2. close and kill bspwm --
super + {_,shift + }q
	bspc node -{c,k}

# 2. 1. 3. alternate between the tiled and monocle layout
super + shift + f
	bspc desktop -l next

# 2. 1. 4. send the newest marked node to the newest preselected node
super + y
	bspc node newest.marked.local -n newest.!automatic.local

# 2. 1. 5. swap the current node and the biggest window
super + g
	bspc node -s biggest.window

#
# 2. 2. state/flags -------------------
#

# 2. 2. 1. set the window state
super + {t,shift + j,k,l}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# 2. 2. 2. set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

#
# 2. 3. focus/swap -----------
#

# 2. 3. 1. focus the node in the given direction
super + {_,shift + }{w,a,s,d}
	bspc node -{f,s} {north, west, south, east}

# 2. 3. 2. focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# 2. 3. 3. focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# 2. 3. 4. focus the last node/desktop
super + {grave,Tab}
	bspc {node,desktop} -f last

# 2. 3. 5. focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on

# 2. 3. 6. focus or send to the given desktop
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#
# 2. 4. preselect ------------
#

# 2. 4. 1. preselect the direction
super + ctrl + {w,a,s,d}
	bspc node -p {north, west, south, east}
	
# 2. 4. 2. preselect the ratio
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# 2. 4. 3. cancel the preselection for the focused node
super + ctrl + space
	bspc node -p cancel

# 2. 4. 4. cancel the preselection for the focused desktop
super + ctrl + Escape
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# 2. 5. move/resize ---------------
#

# 2. 5. 1. expand a window by moving one of its side outward
super + alt + {w,a,s,d}
	bspc node -z {top -20 0,left 0 20,bottom 0 -20,right 20 0}

# 2. 5. 2. contract a window by moving one of its side inward
super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# 2. 5. 3. move a floating window
super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}

```
Next we need to cofigure picom as you can already see from my `bspwmrc` I use picoms window fade feature so theres a nice animation when I open a window I also use rounded corners anyway heres the config:
```
~/.config/picom/picom.conf
```
```
corner-radius = 8;
rounded-corners-exclude = [
    "class_g = 'polybar'",
    "window_type = 'dock'",
];
round-borders = 1;
detect-rounded-corners = true;
```