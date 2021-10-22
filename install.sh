#!/bin/sh

mkdir -p "$HOME/.config" "$HOME/.local" "$HOME/Pics"

# Install dirs
stow -t "$HOME/.config" ".config"
stow -t "$HOME/.local" ".local"
stow -t "$HOME/Pics" "Pics"

# Install files
ln -sv "$HOME/.config/shell/profile" "$HOME/.profile"
ln -sv "$HOME/.config/x11/xinitrc" "$HOME/.xinitrc"
ln -sv "$HOME/.config/x11/xprofile" "$HOME/.xprofile"
ln -sv "$HOME/.config/x11/Xresources" "$HOME/.Xresources"
