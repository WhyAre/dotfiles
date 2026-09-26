#!/usr/bin/env bash
# Move focus in direction l/d/u/r; in monocle, cycle windows instead
if [[ $(hyprctl getoption general:layout -j | jq -r .str) == monocle ]]; then
  case $1 in
    l|u) hyprctl dispatch cyclenext prev tiled ;;
    *) hyprctl dispatch cyclenext tiled ;;
  esac
else
  hyprctl dispatch movefocus "$1"
fi
