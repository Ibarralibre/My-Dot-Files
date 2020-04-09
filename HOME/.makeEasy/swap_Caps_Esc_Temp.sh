xmodmap -e "clear Lock"         #or xmodmap -e "remove Lock = Caps_Lock"

xmodmap -e "keycode 66 = Escape"
xmodmap -e "keycode 9 = Caps_Lock"
xmodmap -e "keycode 65 = space"

xmodmap -e "add Lock = Caps_Lock"
