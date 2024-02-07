# Everything is here, just open your eyes:
# https://github.com/fish-shell/fish-shell

# [[ QoL things ]]
if type -q bat
    alias cat="bat -p"
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT "-c"
end

if type -q exa
    alias ls='exa -g --group-directories-first'
else 
    alias ls='ls --color=auto -hF --group-directories-first'
end
# [[ Editor ]]
if type -q nvim
    set -g editor nvim
else
    set -g editor vim
end
alias v=$editor
alias vi=$editor
alias vim=$editor
alias V="sudo $editor"

## Abbreviations ##
abbr -ag zshrc "$editor ~/.zshrc" # Quickly open zshrc
abbr -ag bashrc "$editor ~/.bashrc" # Quickly open bashrc
abbr -ag ss "sudo systemctl"

alias pls="sudo"
if type -q pacman
    if type -q paru
        alias yay=paru
    else if type -q yay
        alias yay=yay
    else
        alias yay="sudo pacman"
    end
    abbr -ag ups "yay -Syy"
    abbr -ag ins "yay -S --noconfirm --needed"
    abbr -ag unins "yay -Rns --noconfirm"
else if type -q apt
    abbr -ag ups "pls apt update"
    abbr -ag ins "pls apt install -y"
    abbr -ag unins "pls apt purge --auto-remove -y"
end

# Clear
abbr -ag c "clear"

# Applications
abbr -ag g "git"
abbr -ag d "docker"

# Aliases
abbr -ag l 'ls'
abbr -ag ll 'ls -l'
abbr -ag la 'ls -a'
abbr -ag lla 'ls -la'

alias mv "mv -iv"
alias rm "rm -iv"
alias cp "cp -iv"

alias tmux "tmux -u"  # Unicode for tmux

# [[ Environment ]]
if type -q chromium
    set -gx BROWSER (command -v chromium)
else if type -q firefox
    set -gx BROWSER (command -v firefox)
end
set -gx EDITOR (command -v $editor)
set -gx VISUAL (command -v $editor)

set -gx LESS "RX"

if status is-interactive
    set -l path_to_add ~/.local/bin
    contains $path_to_add $PATH; or set -px PATH $path_to_add

    set -l path_to_add ~/go/bin
    contains $path_to_add $PATH; or set -px PATH $path_to_add
end

# Starship
if type -q starship
    starship init fish | source
end

# The Fuck
if type -q thefuck
    thefuck --alias | source 
end
