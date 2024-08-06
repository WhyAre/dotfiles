local wezterm = require 'wezterm'

function getOS()
    sep = package.config:sub(1,1)
    if sep == "/" then
        return "linux"
    end

    return "windows"
end

local config = {
    font_size = 11.0,
    hide_tab_bar_if_only_one_tab = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    font = wezterm.font_with_fallback {
        'MonoLisa',
        'JetBrains Mono',
        'DejavuSans Mono',
    },
    force_reverse_video_cursor = true,
    check_for_updates = false,

    audible_bell = "Disabled",

}

config.color_scheme = 'One Light (base16)'
config.window_frame = {
    active_titlebar_bg = '#f0f0f0',
    inactive_titlebar_bg = '#f0f0f0',
}
config.colors = {
    tab_bar = {
        new_tab = {
            bg_color = '#fff',
            fg_color = '#000',
        },
        new_tab_hover = {
            bg_color = '#fff',
            fg_color = '#000',
        },
        inactive_tab = {
            bg_color = '#fff',
            fg_color = '#000',
        },
        inactive_tab_hover = {
            bg_color = '#ffffff',
            fg_color = '#000',
        },
        active_tab = {
            bg_color = '#ffffff',
            fg_color = '#000',
        },
    },
}

-- config.colors = {
--     -- The default text color
--     foreground = '#EAEAEA',
--     -- The default background color
--     background = '#23252E',
--
--     ansi = { "#1F2229",
--         "#D41919",
--         "#5EBDAB",
--         "#FEA44C",
--         "#367BF0",
--         "#9755B3",
--         "#49AEE6",
--         "#E6E6E6",
--     },
--     brights = {
--         "#198388",
--         "#D41919",
--         "#47D4B9",
--         "#FEA44C",
--         "#277FFF",
--         "#962AC3",
--         "#05A1F7",
--         "#FFFFFF",
--     }
-- }

if getOS() == "windows" then
    config.default_prog = { 'pwsh', '-NoLogo' }
end

return config;
