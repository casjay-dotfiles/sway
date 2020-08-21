#!/usr/bin/env sh
if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
#Arch update check
if [ -f /usr/bin/pacman ]; then
    if ! updates_arch=$(sudo checkupdates 2> /dev/null | wc -l); then
    updates_arch=0
    fi

if [ -f /usr/bin/cower ]; then
    if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
    updates_aur=0
    fi

elif [ -f /usr/bin/trizen ]; then
    if  ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
    fi

    #yay doesn't do sudo
elif [ -f /usr/bin/yay ]; then
    if ! updates_aur=$(yay -Su | wc -l); then
    updates_aur=0
    fi
    fi

    updates=$(("$updates_arch" + "$updates_aur"))
fi

#Debian update check
if [ -f /usr/bin/apt ]; then
    if ! updates=$(sudo apt-get update > /dev/null && apt-get --just-print upgrade | grep "Inst " | wc -l); then
    updates=0
    fi
fi

if [ -f /usr/bin/dnf ]; then
    if ! updates=$(sudo dnf check-update -q | grep -v Security | wc -l); then
    updates=0
    fi
fi

if [ -f /usr/bin/yum ]; then
    if ! updates=$(sudo yum check-update -q | grep -v Security | wc -l); then
    updates=0
    fi
fi

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
fi
