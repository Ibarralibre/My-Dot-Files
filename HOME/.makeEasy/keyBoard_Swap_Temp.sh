# xev =>to know the keyBoard name/code

xmodmap -e "clear Lock"         #or xmodmap -e "remove Lock = Caps_Lock"

xmodmap -e "keysym Caps_Lock = space"	#to make caps_lock=space    
xmodmap -e "keycode 9 = Escape"     	#set Escape as its default state

xmodmap -e "add Lock = Caps_Lock"
