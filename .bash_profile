
[[ -f ~/.bashrc ]] && source ~/.bashrc

if [[ -z "$DISPLAY" ]]; then
    ttyname=$(tty)
    if [[ $ttyname == /dev/tty1 ]]; then
        startx
    elif [[ $ttyname == /dev/tty2 ]]; then
        startx /home/$USER/.xinitrc.gnome
    fi
fi

