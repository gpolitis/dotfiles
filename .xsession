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