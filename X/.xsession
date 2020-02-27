#!/bin/bash
# Straight ion3 session
#/usr/bin/gnome-settings-daemon &
##xfce-mcs-manager & # steals <alt>-<f2> for its own purposes
#Thunar --daemon &
xmodmap ~/.xmodmaprc
xrdb -load ~/.Xdefaults
#xrandr --output DVI-0 --right-of VGA-0
xrandr --output DisplayPort-0 --mode 1920x1080 --output DVI-0 --mode 1920x1080 --right-of DisplayPort-0
#mate-volume-control-applet &
#mate-bluetooth-applet &
#nm-applet &
#dropbox start &
xscreensaver &
/home/grant/davmail/davmail.sh &
/opt/bin/dropbox &
# hp-toolbox &
#rhythmbox &
#seapplet &
#gnome-keyring-daemon &
#argyll-dispwin -d 2 ~/.local/share/icc/la2205.icc
#argyll-dispwin -d 1 ~/.local/share/icc/e231.icc
sleep 2
trayion &
keychain &
# tiddlywiki server
pidof node > /dev/null
if [[ $? -ne 0 ]] ; then
    tiddlywiki $HOME/Dropbox/Tiddly/tiddlynodejs --server &
fi
#LC_TIME=C /home/grant/bin/insync/insync-portable start &
#exec /home/grant/notion/bin/notion -session default-session--0
#exec /usr/bin/i3
#exec qtile
exec /usr/bin/notion -session default-session--0
#exec fluxbox

## Running ion3 from gnome-session
##exec >> /home/grant/.xsession-errors 2>&1
##echo "Shell is $SHELL" >> /home/grant/.xsession-errors
##echo "before sourcing .bash_profile" >> /home/grant/.xsession-errors
##. /home/grant/.bashrc
##echo "after sourcing .bash_profile" >> /home/grant/.xsession-errors
#. /home/grant/.gnomerc
##echo "after sourcing .gnomerc" >> /home/grant/.xsession-errors
#xmodmap ~/.xmodmaprc
#cd
#exec gnome-session

# Other WMs
#exec awesome
#exec startxfce4
#exec fluxbox
#exec startkde
