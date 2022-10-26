#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/config.conf"
. "$SCRIPT_PATH/smb.secret"

rclone sync :smb,host=$src_host,user=$smb_user,pass=$smb_pass,domain=$smb_domain:$src_path :smb,host=$dst_host,user=$smb_user,pass=smb_pass,domain=$smb_domain:$dst_path 
