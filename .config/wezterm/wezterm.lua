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
    use_fancy_tab_bar = false,
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

    keys = {
        {
            key = 'Enter',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
    }

}

-- Colours
-- https://wezterm.org/config/appearance.html#defining-a-color-scheme-in-a-separate-file
-- Even though they suggest to use toml,
-- I'm just going to define my colour scheme in a separate lua file.
-- The reason is because it said on windows the path is relative to the wezterm.exe,
-- instead of to the config file (not explicitly mentioned).
-- Requiring local lua file is more consistent

local colours = require 'one_light'
for k,v in pairs(colours) do config[k] = v end

if getOS() == "windows" then
    config.default_prog = { 'pwsh', '-NoLogo' }
end

return config;
