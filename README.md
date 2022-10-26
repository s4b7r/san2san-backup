# Git remote backup

Daily backup from SAN to another SAN, with simple SMB mounts.

## Setup

1. Create direcotries on the additional backup destionation:
   - ...?
2. Run `1-create-localdir.sh`
3. `chmod u+x backup_do_*.sh`
4.  Run `requirements.sh`
5.  Create `smb.secret` from `smb.secret.sample`
6.  Fill all variables in `config.conf`.
7.  Add `backup_do_*.sh` scripts to crontab: use `crontab -e` or put into `/etc/crontab`, e.g.:
    -  `0  19 *   * *   <SCRIPT PATH>/backup_do_daily.sh`
