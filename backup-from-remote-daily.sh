#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

"$HOME/scripts/vpn/vpnconnect.sh"

cd $SCRIPT_PATH/localbackup/mirror_destination
for D in *; do
    if [ -d "${D}" ]; then
        echo $D
        cd $D
        echo `pwd`
        git remote update
        cd ..
    fi
done
cd $SCRIPT_PATH
7z a "$SCRIPT_PATH/localbackup/daily_this_week/daily_this_week_$(date +%Y-%m-%d).7z" "$SCRIPT_PATH/localbackup/mirror_destination/*"

"$HOME/scripts/vpn/vpndisconnect.sh"

