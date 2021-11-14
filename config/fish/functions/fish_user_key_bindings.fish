function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    # Make !! and !$ work
    # https://superuser.com/questions/719531/what-is-the-equivalent-of-bashs-and-in-the-fish-shell/719574
    bind -M insert ! bind_bang
    bind -M insert '$' bind_dollar

    # Makes vim mode include all the emacs bindings
    # https://fishshell.com/docs/current/interactive.html?highlight=vim#vi-mode-commands
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
