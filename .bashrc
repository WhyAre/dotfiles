#!/bin/bash
# The purpose of this bashrc is to provide sensible defaults

. ~/.config/shell/helper_scripts
. ~/.config/shell/env
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Import things
. ~/.config/shell/aliases
. ~/.profile

# Configuration
shopt -s histverify

# FZF Key Bindings
if command -v fzf &> /dev/null; then
  eval "$(fzf --bash)"
fi

# if [ -f "/usr/share/fzf/shell/key-bindings.bash"  ]; then
#     source /usr/share/fzf/shell/key-bindings.bash
# elif [ -f "/usr/share/bash-completion/completions/fzf-key-bindings" ]; then
#     source /usr/share/bash-completion/completions/fzf-key-bindings
# fi

if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
else
    if [ -f "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
        source /usr/share/git-core/contrib/completion/git-prompt.sh
    fi
    PS1='\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)" 2>/dev/null)\n\$ '
fi

## Zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
    alias cd=z
fi
## thefuck
if command -v thefuck &>/dev/null; then
    eval "$(thefuck --alias)"
fi
