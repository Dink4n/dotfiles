#!/bin/sh


alacrittyThemesDir=$HOME/.config/alacritty/themes
if [ $(($RANDOM % 2)) -eq 1 ]; then
    colordir=$alacrittyThemesDir/other/themes
else
    colordir=$alacrittyThemesDir/base16/colors
fi

colorschemes=($(ls $colordir))
colorschemesLength=${#colorschemes[@]}

currentColorschemeNum=$(($RANDOM % $(($colorschemesLength))))
currentColorscheme="$colordir/${colorschemes[currentColorschemeNum]}"

alacritty-colorscheme -a $currentColorscheme
