#!/bin/sh

if command -v yay > /dev/null; then
    ins_command="yay"
else
    ins_command="pacman"
fi

alias ins="$ins_command -S"
alias unins="$ins_command -Rns"
alias ups="$ins_command -Syu"
alias list="$ins_command -Qent"
