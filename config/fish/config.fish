# Everything is here, just open your eyes:
# https://github.com/fish-shell/fish-shell

# [[ QoL things ]]
if type -q bat
    alias cat="bat -p"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end

# [[ Editor ]]
if type -q nvim
    set -g editor nvim
else
    set -g editor vim
end
alias v=$editor

## Abbreviations ##
abbr -ag zshrc "$editor ~/.zshrc" # Quickly open zshrc
abbr -ag bashrc "$editor ~/.bashrc" # Quickly open bashrc
abbr -ag ss "sudo systemctl"
abbr -ag sp "sudo pacman -S --noconfirm"

# Git things
abbr -ag ga "git add"
abbr -ag gs "git status"
abbr -ag gd "git diff"
abbr -ag gl "git log --oneline"
abbr -ag gpull "git pull origin main"
abbr -ag gpush "git push origin main"
abbr -ag gc "git commit"
abbr -ag gcs "git commit -S"


# [[ Aliases ]]
alias ls='ls --color=auto -hF'
alias ll='ls -l'
alias la='ls -a'
alias lla='ll -a'

alias mv "mv -iv"
alias rm "rm -iv"
alias cp "cp -iv"

alias tmux "tmux -u"

# [[ Environment ]]
set -gx BROWSER /usr/bin/firefox
set -gx EDITOR /usr/bin/vim
set -gx VISUAL /usr/bin/vim

if status is-interactive
    set -l path_to_add ~/.local/bin
    contains $path_to_add $PATH; or set -px PATH $path_to_add
end

# [[ Starship ]] 
starship init fish | source

# [[ The Fuck ]] 
if type -q thefuck
    thefuck --alias | source 
end
