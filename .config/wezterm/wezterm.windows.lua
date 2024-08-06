local wezterm = require 'wezterm'

local config = {
    font_size = 11.0,
    hide_tab_bar_if_only_one_tab = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    default_prog = { 'pwsh', '-NoLogo' },
    font = wezterm.font 'MonoLisa',
    force_reverse_video_cursor = true,
    check_for_updates = false,

    audible_bell = "Disabled",

}

config.colors = {
    -- The default text color
    foreground = '#EAEAEA',
    -- The default background color
    background = '#23252E',

    ansi = { "#1F2229",
        "#D41919",
        "#5EBDAB",
        "#FEA44C",
        "#367BF0",
        "#9755B3",
        "#49AEE6",
        "#E6E6E6",
    },
    brights = {
        "#198388",
        "#D41919",
        "#47D4B9",
        "#FEA44C",
        "#277FFF",
        "#962AC3",
        "#05A1F7",
        "#FFFFFF",
    }
}

return config
