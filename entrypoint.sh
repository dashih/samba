#!/bin/sh

echo "Reading password file"
SAMBA_PASSWORD=`cat $SAMBA_PASSWORD_FILE`

echo "Creating user: $SAMBA_USER"
useradd $SAMBA_USER
echo "$SAMBA_USER:$SAMBA_PASSWORD" | chpasswd

echo "Adding samba user: $SAMBA_USER"
(echo $SAMBA_PASSWORD; echo $SAMBA_PASSWORD) | smbpasswd -a -s $SAMBA_USER

echo "Starting samba"
smbd --foreground
