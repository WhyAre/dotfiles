-- This colour scheme is a scam, it doesn't set the colours right
local config = {}
config.colors = {
  foreground = "#323640",
  background = "#f8f8fc",
  cursor_bg = "#D4A017",
  cursor_fg = "#f8f8fc",
  selection_bg = "#C6DBFF",
  split = "#7e8a9e",
  ansi = {
    '#000000',  -- black
    "#CC0000",  -- red
    "#51A150",  -- green
    "#3D76F3",  -- yellow
    "#AB31A9",  -- blue
    "#976700",  -- magenta
    "#AB31A9",  -- cyan
    "#323640",  -- white
  },
  brights = {
    "#A0A1A7",
    "#CC0000",
    "#51A150",
    "#3D76F3",
    "#AB31A9",
    "#976700",
    "#AB31A9",
    "#323640",
  },
  tab_bar = {
    background = "#f8f8fc",
    active_tab = {
      bg_color = "#f0f0f9",
      fg_color = "#323640",
    },
    inactive_tab = {
      bg_color = "#f8f8fc",
      fg_color = "#A0A1A7",
    },
    inactive_tab_hover = {
      bg_color = "#ebebf4",
      fg_color = "#323640",
    },
    new_tab = {
      bg_color = "#f8f8fc",
      fg_color = "#A0A1A7",
    },
    new_tab_hover = {
      bg_color = "#3D76F3",
      fg_color = "#323640",
    },
  },
}
return config
