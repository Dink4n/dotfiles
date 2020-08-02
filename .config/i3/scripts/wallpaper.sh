#!/usr/bin/bash


basedir="$HOME/Wallpapers/anu/"
randomdir=`/usr/bin/ls $basedir | /usr/bin/shuf -n 1`
while [ $randomdir == 'Gif' ]
do
    randomdir=`/usr/bin/ls $basedir | /usr/bin/shuf -n 1`
done
selectedDir="$basedir$randomdir"
file=`/usr/bin/ls $selectedDir | /usr/bin/shuf -n 1`
filepath="${selectedDir}/$file"
echo $filepath
wal -i $filepath
$HOME/.config/alacritty/scripts/pywal.sh
