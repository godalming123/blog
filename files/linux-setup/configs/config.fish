if status is-interactive
   # ===================
   # === Add aliases ===
   #====================
   
   # ls aliases
   alias ls='ls --color=auto'
   alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
   alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
   
   # window manager aliases
   alias bspwm='bash ~/.config/bspwm/bspwmrc'
   alias polybar='bash ~/.config/polybar/launch.sh'
   alias sxhkd='pgrep -x sxhkd > /dev/null || sxhkd'
   alias killpi='killall picom'
   alias repi='killall picom && picom --experimental-backends'
   alias pi='picom --experimental-backends'
   alias screens='bash ~/.screenlayout/workstation-non-glitchy.sh'
   alias conky='bash ~/.config/conky/conkystartup.sh'
   alias jgmenu='killall jgmenu'
   
   # configuration aliases
   alias config='cd ~/.config && micro /etc/lightdm/lightdm.conf /etc/lightdm/lightdm-gtk-greeter.conf ~/.bashrc fish/config.fish  ~/.profile alacritty/alacritty.yml bspwm/bspwmrc picom/picom.conf  polybar/config polybar/launch.sh polybar/polywins.sh sxhkd/sxhkdrc jgmenu/jgmenurc jgmenu/append.csv jgmenu/prepend.csv jgmenu/menu-on-right jgmenu/right-click-menu'
end

# ===========================
# === Some fish functions ===
#============================

# print a seperater
function print_sep
    set_color -o green
    echo -n "┌─┐"
end

# generate the prompt text
function fish_prompt
    if test $status -eq 0
        set success true
    else
        set success false
    end
    
    echo ""

    set_color green
    echo -n "╭┐"
    
    switch $success
        case true
            set_color -o 41fc2f
            echo -n "✓"
        case false
            set_color -o fc2f2f
            echo -n "✗"
    end

    print_sep

    set_color -o fc922f
    echo -n "🗁  "
    echo -n (prompt_pwd)

    print_sep

    set_color -o fcf22f
    echo  -n " time"

    set_color -o 88fc2f
    echo -n "  date"

    print_sep
    
    set_color -o 2ffcbb
    echo -n "branch: "

    if git rev-parse --git-dir > /dev/null 2>&1 then # if this repo is a git repo
        git rev-parse --abbrev-ref HEAD
    else
        echo "none"
    end

    set_color -o green
    echo "╰─> "
end

# text that appears when you first load fish
function fish_greeting
    /bin/ufetch-arch.sh
    echo  ──────────────────────────────────────────────────────
end
