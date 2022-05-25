#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
GTK_THEME=Adwaita:dark
QT_QPA_PLATFORMTHEME=qt5ct


# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -f ~/.xprofile ] && . ~/.xprofile

setxkbmap -option caps:escape
# change location of monitors
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output DVI-D-0 --mode 1920x1080 --rate 120 --output HDMI-0 --auto --left-of DVI-D-0 &
# red light at night
redshift -c .config/redshift.conf &
nitrogen --restore &
picom &
emacs --daemon --with-x-toolkit=lucid &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }" &
syncthing & # localhost:8384
exec awesome
