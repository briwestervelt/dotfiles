
[[ -f ~/.bashrc ]] && source ~/.bashrc

if [[ -z "$DISPLAY" ]] && [[ $(tty) == /dev/tty1 ]]; then
    startx
fi

