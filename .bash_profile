
[[ -f ~/.bashrc ]] && source ~/.bashrc

if [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
    ttyname=$(tty)
    case $ttyname in
        /dev/tty1)
            startx $HOME/.xinitrc
            ;;
        /dev/tty2)
            # TODO: get gnome working eventually
            if [[ $XDG_SESSION_TYPE == wayland ]]; then
                MOZ_ENABLE_WAYLAND=1 \
                QT_QPA_PLATFORM=wayland \
                exec dbus-run-session gnome-session
            else
                echo "Wait a sec, tty2 is not wayland :("
            fi
            ;;
    esac
fi

