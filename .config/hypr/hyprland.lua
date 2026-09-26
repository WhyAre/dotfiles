local mainMod = "SUPER"
local terminal = "wezterm"
local menu = "rofi -show combi"

hl.monitor({ output = "eDP-1", mode = "1280x720@60", position = "0x0", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("mako")
  hl.exec_cmd("waybar")
  hl.exec_cmd("flatpak run com.discordapp.Discord")
  hl.exec_cmd("flatpak run org.telegram.desktop")
end)

hl.config({
  input = {
    kb_layout = "us",
    touchpad = { tap_to_click = true },
  },
  general = {
    border_size = 2,
    gaps_in = 0,
    gaps_out = 0,
    layout = "monocle",
  },
  dwindle = { force_split = 2 },
  animations = { enabled = false },
  cursor = { no_warps = true },
})

hl.window_rule({ match = { class = "^(vivaldi-stable)$" }, workspace = "1 silent" })
hl.window_rule({ match = { class = "^(Todoist)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(org.telegram.desktop)$" }, workspace = "name:messages silent" })
hl.window_rule({ match = { class = "^(discord)$" }, workspace = "name:messages silent" })

-- Basics
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("screenshot"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("vivaldi-stable"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(
  "swaynag -t warning -m 'Exit Hyprland?' -B 'Yes' \"hyprctl dispatch 'hl.dsp.exit()'\""))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Layout: set the layout of the active workspace only
local function activeWorkspace()
  return hl.get_active_special_workspace() or hl.get_active_workspace()
end

local function setLayout(layout)
  return function()
    local ws = activeWorkspace()
    if not ws then return end
    local target = ws.special and tostring(ws.name) or "name:" .. tostring(ws.name)
    hl.workspace_rule({ workspace = target, layout = layout })
  end
end

hl.bind(mainMod .. " + W", setLayout("monocle"))
hl.bind(mainMod .. " + E", setLayout("dwindle"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float())

-- Focus: cycle in monocle, move focus otherwise
local function focus(dir)
  return function()
    local ws = activeWorkspace()
    if ws and ws.tiled_layout == "monocle" then
      hl.dispatch(hl.dsp.window.cycle_next({ next = dir == "r" or dir == "d", tiled = true }))
    else
      hl.dispatch(hl.dsp.focus({ direction = dir }))
    end
  end
end

local DIRECTION_KEYS = {
  H = "l", J = "d", K = "u", L = "r",
  Left = "l", Down = "d", Up = "u", Right = "r",
}

for key, dir in pairs(DIRECTION_KEYS) do
  hl.bind(mainMod .. " + " .. key, focus(dir))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }))
end

-- Workspaces (xmonad-style: pull workspace to the focused monitor)
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + T",
  hl.dsp.focus({ workspace = "name:messages", on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + T",
  hl.dsp.window.move({ workspace = "name:messages", follow = false }))

-- Scratchpad
hl.bind(mainMod .. " + SHIFT + Minus",
  hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mainMod .. " + Minus", hl.dsp.workspace.toggle_special())

-- Resize
local RESIZE_STEPS = {
  H = { -10, 0 }, J = { 0, 10 }, K = { 0, -10 }, L = { 10, 0 },
  Left = { -10, 0 }, Down = { 0, 10 }, Up = { 0, -10 }, Right = { 10, 0 },
}

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  for key, step in pairs(RESIZE_STEPS) do
    hl.bind(key, hl.dsp.window.resize({ x = step[1], y = step[2], relative = true }),
      { repeating = true })
  end
  hl.bind("Return", hl.dsp.submap("reset"))
  hl.bind("Escape", hl.dsp.submap("reset"))
end)

-- Media keys
local LOCKED = { locked = true }
local LOCKED_REPEAT = { locked = true, repeating = true }

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), LOCKED)
hl.bind("XF86AudioLowerVolume",
  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), LOCKED_REPEAT)
hl.bind("XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), LOCKED_REPEAT)
hl.bind("XF86AudioMicMute",
  hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), LOCKED)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), LOCKED_REPEAT)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), LOCKED_REPEAT)
hl.bind("Print", hl.dsp.exec_cmd("grim"))
