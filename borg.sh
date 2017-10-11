#!/bin/sh
exec >> "/data/borg-log/$(date +%Y-%m-%d\ %H:%M)" 
exec 2>&1
dpkg --get-selections > ~/.packages
echo ""
echo "	Borg create:"
borg create /data/borg::'{now:%Y-%m-%d %H:%M}' /home 		\
	--exclude-from ~/.config/borg/pattern.txt	\
	--list --filter=AME					\
	--stats							\
	--compression auto,lzma
echo ""
echo "	Borg prune:"
borg prune /data/borg -y=365 -m=31 -w=7 -d=24 -H=60 --keep-minutely=60 --stats
