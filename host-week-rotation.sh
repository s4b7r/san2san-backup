#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

rm $SCRIPT_PATH/localbackup/daily_last_week/*
7z a "$SCRIPT_PATH/localbackup/daily_last_week/daily_last_week_$(date +%Y-%m-%d).7z" "$SCRIPT_PATH/localbackup/daily_this_week/*"
rm $SCRIPT_PATH/localbackup/daily_this_week/*
