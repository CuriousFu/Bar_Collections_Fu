#!/bin/bash
set -e
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l) 

check=$((pac + aur))
while [[ "$check" != "0" ]]
do
    echo "$pac %{F#ff00b7}%{F-} $aur"
    sleep 1m
    pacaur -Syu --noconfirm --noedit
    if [ $? -eq 0 ]
    then
        sleep 3s
   # i3 restart 
   sh ~/.config/polybar/launch.sh &
   else
       pacaur -Sc --noconfirm
   fi
#else
   # echo "$pac %{F#ff00b7}%{F-} $aur">/dev/null 2>&1 
#   &>/dev/null
done
