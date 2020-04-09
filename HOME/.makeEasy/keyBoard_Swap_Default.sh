# keyboards directories => /usr/share/X11/xkb/symbols/
# xev =>to know the keyBoard name/code
 
xmodmap -e "clear Lock"         #or xmodmap -e "remove Lock = Caps_Lock"

xmodmap -e "keycode 65 = space"		
xmodmap -e "keycode 66 = Caps_Lock"	
xmodmap -e "keycode 9 = Escape"	

xmodmap -e "add Lock = Caps_Lock"