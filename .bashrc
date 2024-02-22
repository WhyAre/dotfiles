#!/bin/bash
# The purpose of this bashrc is to provide sensible defaults

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Import things
. ~/.config/shell/helper_scripts
. ~/.config/shell/env
. ~/.config/shell/aliases

# Configuration
shopt -s histverify

if command -v pfetch &>/dev/null; then
    pfetch
fi

if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
else
    if [ -f "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
        source /usr/share/git-core/contrib/completion/git-prompt.sh
    fi
    PS1='\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)" 2>/dev/null)\n\$ '
fi

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/shell/key-bindings.bash
fi
