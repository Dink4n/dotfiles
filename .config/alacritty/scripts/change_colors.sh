#!/bin/sh

colordir=$1
newColorscheme=$2
alacrittyThemesDir=$HOME/.config/alacritty/themes

echo $alacrittyThemesDir/$colordir/themes/$newColorscheme

if [ -d $alacrittyThemesDir/$colordir ]; then
    if [ -f $alacrittyThemesDir/$colordir/themes/$newColorscheme ]; then
        alacritty-colorscheme -a $alacrittyThemesDir/$colordir/themes/$newColorscheme
    fi
fi
