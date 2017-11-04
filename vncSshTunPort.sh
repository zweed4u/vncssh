#!/bin/bash
read -p "IP of target you wish to VNC: " target
# Add automated installation process of x11vnc rather than check if installed

if [ "$(ssh zweeden@$target 'dpkg --get-selections | grep x11vnc')" ]
 then
  ssh zweeden@$target -L 5900:localhost:5900 "x11vnc -display :0 -noxdamage";
else
  echo "You must install x11vnc on the remote target first!";
fi
