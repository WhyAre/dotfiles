# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import random
import subprocess

from libqtile import bar, hook, layout

try:
    from qtile_extras import widget
except ImportError:
    from libqtile import widget

from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# from libqtile.utils import guess_terminal


def get_random_wallpaper(wallpaper_dir="~/Pictures/wallpaper"):
    wallpaper_dir = os.path.expanduser(wallpaper_dir)
    wallpapers = []
    for root, subdir, files in os.walk(wallpaper_dir):
        for f in files:
            wallpapers.append(os.path.join(root, f))
    return random.choice(wallpapers)


@hook.subscribe.startup_once
def autostart():
    subprocess.Popen("nm-applet")
    # subprocess.Popen("blueman-applet")
    subprocess.Popen(["xss-lock", "xsecurelock"])
    # subprocess.Popen(["picom"])
    subprocess.Popen("/usr/libexec/polkit-gnome-authentication-agent-1")


primary_colour = "#53baf5"


def primary(input: str):
    return f"<span foreground='{primary_colour}'>{input}</span>"


# Configuration
mod = "mod4"
terminal = "wezterm"
browser = "flatpak run app.zen_browser.zen"
screenshot = "flameshot gui"
file_browser = "nemo"
lockscreen = "xsecurelock"
window_switcher = "rofi -show window"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink_main(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow_main(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        desc="Grow window down",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        desc="Grow window up",
    ),
    Key([mod], "s", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    # Key([mod], "f", lazy.window.toggle_maximize(), desc="Toggle maximize"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Spawn applications
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "control"], "f", lazy.spawn(browser), desc="Launch brave"),
    Key([mod, "shift"], "s", lazy.spawn(screenshot), desc="Launch flameshot"),
    Key([mod], "e", lazy.spawn(file_browser), desc="Launch file manager"),
    Key(
        [mod, "shift", "control"], "l", lazy.spawn(lockscreen), desc="Launch lockscreen"
    ),
    Key(
        [mod, "shift", "control"],
        "q",
        lazy.spawn(
            "rofi -show power-menu -modi power-menu:'rofi-power-menu --no-symbols'"
        ),
        desc="Launch lockscreen",
    ),
    Key(
        [mod],
        "d",
        lazy.spawn(["rofi", "-show", "combi"]),
        desc="Spawn an application using rofi",
    ),
    Key(["mod1"], "Tab", lazy.spawn(window_switcher), desc="Switch window"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 5%+")),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.widget["pulsevolume"].increase_vol(),
        desc="Volume Up",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.widget["pulsevolume"].decrease_vol(),
        desc="volume down",
    ),
    Key([], "XF86AudioMute", lazy.widget["pulsevolume"].mute(), desc="Volume Mute"),
    # Key([], "XF86AudioPlay", lazy.widget["pulsevolume"].decrease_vol(), desc='playerctl'),
    # Key([], "XF86AudioPrev", lazy.widget["pulsevolume"].decrease_vol(), desc='playerctl'),
    # Key([], "XF86AudioNext", lazy.widget["pulsevolume"].decrease_vol(), desc='playerctl'),
]

# groupkeymap = [
#     (Group("1"), "1"),
#     (Group("2"), "2"),
#     (Group("3"), "3"),
#     (Group("4"), "4"),
#     (Group("5"), "5"),
#     (Group("6"), "6"),
#     (Group("7"), "7"),
#     (Group("8"), "8"),
#     (Group("9"), "9"),
#     (Group("0"), "m"),
# ]
# groups = [Group(i) for i in "1234567890"]
groups = [
    Group("1", matches=Match(role="browser")),
    Group("2"),
    Group("3"),
    Group("4", matches=Match(wm_class="obsidian")),
    Group(
        "5", matches=[Match(wm_class="morgen"), Match(wm_class="Todoist")], layout="max"
    ),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
    Group(
        "a",
        matches=[
            Match(wm_class="telegram-desktop"),
            Match(wm_class="discord"),
            Match(wm_class="mattermost"),
        ],
        label="0",
    ),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(border_focus="#07b9f5", border_width=2),
    layout.Max(),
    layout.Floating(),
    # layout.MonadTall(single_border_width=0),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=0,
)
extension_defaults = widget_defaults.copy()

sep_padding = 10
wifi_interface = "wlo1"

screens = [
    Screen(
        wallpaper=get_random_wallpaper(),
        wallpaper_mode="stretch",
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    this_current_screen_border=primary_colour,
                    borderwidth=3,
                    hide_unused=True,
                ),
                # widget.Prompt(),
                widget.TaskList(
                    max_title_width=150,
                ),
                # widget.Chord(
                #     chords_colors={
                #         "launch": ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                widget.StatusNotifier(),  # Backup when qtile extras isn't installed
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                widget.Systray(),
                widget.Sep(padding=sep_padding),
                widget.CurrentLayoutIcon(
                    scale=0.7,
                ),
                widget.Sep(padding=sep_padding),
                widget.Memory(fmt=f"{primary('RAM')}  {{}}", format="{MemPercent}%"),
                widget.Sep(padding=sep_padding),
                widget.CPU(fmt=f"{primary('CPU')}  {{}}", format="{load_percent}%"),
                widget.Sep(padding=sep_padding),
                widget.DF(
                    fmt=f"{primary('/')}  {{}}",
                    format="{r:.0f}%",
                    visible_on_warn=False,
                ),
                # widget.Sep(padding=sep_padding),
                # widget.Backlight(
                #     fmt=f"{primary('BRT')}  {{}}", backlight_name="intel_backlight"
                # ),
                widget.Sep(padding=sep_padding),
                widget.PulseVolume(fmt=f"{primary('VOL')}  {{}}"),
                widget.Sep(padding=sep_padding),
                widget.Battery(
                    charge_char="+",
                    discharge_char="-",
                    fmt=f"{primary('BAT')}  {{}}",
                    format="{char}{percent:2.0%}",
                ),
                widget.Sep(padding=sep_padding),
                widget.KeyboardLayout(
                    foreground=primary_colour,
                    configured_keyboards=[
                        "us colemak_dh_ortho",
                        "us colemak_dh_wide",
                        "us",
                    ],
                    display_map={
                        "us": "Qwerty",
                        "us colemak_dh_wide": "Colemak DH Wide",
                        "us colemak_dh_ortho": "Colemak DH Ortho",
                    },
                ),
                widget.Sep(padding=sep_padding),
                widget.Wlan(
                    interface=wifi_interface,
                    fmt=f"{primary(wifi_interface)}  {{}}",
                    format="{essid}",
                ),
                widget.Sep(padding=sep_padding),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                # widget.Notify(),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
