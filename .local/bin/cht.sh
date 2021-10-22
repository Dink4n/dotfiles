#!/bin/sh

selected=$(printf '' | dmenu -p "Language: ")
query=$(printf '' | dmenu -p "Query: " | tr ' ' '+')

# st -e zsh -c "curl -s cheat.sh/$selected/$query | less"
curl -s cheat.sh/$selected/$query | less
