# Everything is here, just open your eyes:
# https://github.com/fish-shell/fish-shell

set fish_greeting
# [[ QoL things ]]
if type -q bat
    alias cat="bat -p"
    set -gx  MANPAGER "sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
end

set -l ls_flags  "--color=auto --classify --group-directories-first"
if type -q eza
    alias ls="eza $ls_flags -g --sort=age"
else
    alias ls="ls $ls_flags -h"
end

# [[ Editor ]]
if type -q nvim
    set -f editor nvim
else
    set -f editor vim
end
alias v=$editor
alias vi=$editor
alias vim=$editor
alias V="sudo $editor"

## Abbreviations ##
abbr zshrc "$editor ~/.zshrc" # Quickly open zshrc
abbr bashrc "$editor ~/.bashrc" # Quickly open bashrc
abbr ss "sudo systemctl"

alias pls="sudo"
if type -q pacman
    if type -q paru
        alias yay=paru
    else if type -q yay
        alias yay=yay
    else
        alias yay="sudo pacman"
    end
    abbr ups "yay -Syy"
    abbr ins "yay -S --noconfirm --needed"
    abbr unins "yay -Rns --noconfirm"
else if type -q apt
    abbr ups "pls apt update"
    abbr ins "pls apt install -y"
    abbr unins "pls apt purge --auto-remove -y"
else if type -q zypper
    abbr up "pls zypper upgrade"
    abbr dup "pls zypper dist-upgrade"
    abbr ins "pls zypper install -y"
    abbr unins "pls zypper remove -u"
end

# Clear
abbr c "clear"

# Applications
abbr g "git"
abbr d "docker"

# Aliases
abbr l 'ls'
abbr ll 'ls -l'
abbr la 'ls -a'
abbr lla 'ls -la'

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

fish_add_path -g ~/.bin
fish_add_path -g ~/.local/bin
fish_add_path -g ~/go/bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g /usr/local/texlive/2025/bin/x86_64-linux
fish_add_path -g ~/.elan/bin
fish_add_path -g ~/.ghcup/bin
fish_add_path -g ~/.cabal/bin
fish_add_path -g ~/.local/share/coursier/bin
fish_add_path -g ~/.local/share/JetBrains/Toolbox/scripts

# Starship
if type -q starship
    starship init fish | source
end

# The Fuck
if type -q thefuck
    thefuck --alias | source
end

# Zoxide
if type -q zoxide
    zoxide init --cmd cd fish | source
end

# Custom Keybindings
bind ctrl-w backward-kill-bigword
bind ctrl-x,ctrl-u undo
bind ctrl-x,ctrl-e edit_command_buffer
# bind ctrl-l scrollback-push


