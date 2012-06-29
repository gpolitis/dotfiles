if [ -f /usr/bin/hsetroot ]
then
    /usr/bin/hsetroot -solid "#191970"
fi

if [ -f /usr/bin/urxvtd ]
then
    /usr/bin/urxvtd -q -f -o
    ln -s /usr/bin/urxvtc ~/.xmonad/xmonad-terminal
else
    ln -s /usr/bin/xterm ~/.xmonad/xmonad-terminal
fi

if [ -f /usr/bin/xscreensaver ]
then
    /usr/bin/xscreensaver -no-splash &
fi

setxkbmap -layout "fr,gr" -option "grp:alt_shift_toggle"

if [ -f /home/gp/bin/startup.sh ]
then
    /home/gp/bin/startup.sh
fi

if [ -f ~/.cabal/bin/xmonad ]
then
    exec ~/.cabal/bin/xmonad
else
    exec xmonad
fi

#xpmroot ~/Pictures/escher-big.xpm &
# http://www.imagemagick.org/Usage/resize/#resize
# convert escher-big.jpg -resize 1680x1050\> -size 1680x1050 xc:black +swap -gravity center -composite escher-big.xpm
#exec xmonad
