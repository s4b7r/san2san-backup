#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

"$HOME/scripts/vpn/vpnconnect.sh"

rm $SCRIPT_PATH/localbackup/weekly_this_week/*

cd $SCRIPT_PATH/localbackup/mirror_destination
for D in *; do
    if [ -d "${D}" ]; then
        git remote update
    fi
done
7z a "$SCRIPT_PATH/localbackup/weekly_this_week/weekly_this_week_$(date +%Y-%m-%d).7z" "$SCRIPT_PATH/localbackup/mirror_destination/*"

"$HOME/scripts/vpn/vpndisconnect.sh"

