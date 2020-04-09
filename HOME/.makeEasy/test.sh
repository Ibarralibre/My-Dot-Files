# Swap Caps_Lock and Space

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "remove Space"
xmodmap -e "keysym Space = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Space"
xmodmap -e "add Lock = Caps_Lock"
xmodmap -e "add Space"

