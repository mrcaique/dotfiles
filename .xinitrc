#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-fill $HOME/.2001_a_space_odyssey.jpg # Set walllpaper
redshift &
setxkbmap -layout br # Set keyboard map to BR
exec i3 -c $HOME/dotfiles/.i3/config # Start i3 Window Manager

