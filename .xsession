if [ -f /usr/bin/hsetroot ]
then
  /usr/bin/hsetroot -solid "#191970"
fi

if [ -f /usr/bin/urxvtd ]
then
  /usr/bin/urxvtd -q -f -o
fi

if [ -f /usr/bin/xscreensaver ]
then
  /usr/bin/xscreensaver -no-splash &
fi

if [ -f /home/gp/.cabal/bin/xmonad ]
then
  exec /home/gp/.cabal/bin/xmonad
else
  exec xmonad
fi

#xpmroot ~/Pictures/escher-big.xpm &
# http://www.imagemagick.org/Usage/resize/#resize
# convert escher-big.jpg -resize 1680x1050\> -size 1680x1050 xc:black +swap -gravity center -composite escher-big.xpm
#exec xmonad