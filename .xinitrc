#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-fill $HOME/.wallpaper.{jpg, png} # Set walllpaper
redshift &
setxkbmap -layout br # Set keyboard map to BR
exec i3 -c $HOME/dotfiles/.i3/config # Start i3 Window Manager

