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

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import Any, Callable
from libqtile.log_utils import logger
from libqtile import hook
import os
import subprocess

mod = "mod1"
# terminal = guess_terminal()
terminal = "alacritty"
web = "firefox"
file = "ranger"
music = "ncmpcpp"
monitor = "btop"
alacrittyOpacity = "-o window.opacity=0.5"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(),                                   desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(),                                  desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(),                                   desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(),                                     desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),                  desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),                 desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),                  desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),                    desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),                   desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),                  desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),                   desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),                     desc="Grow window up"),
    Key([mod], "y", lazy.layout.normalize(),                              desc="Reset all window sizes"),
    # Grow for monadtall/monadwide
    Key([mod], "u", lazy.layout.grow(),                                   desc="Grow selected window"),
    Key([mod], "i", lazy.layout.shrink(),                                 desc="Shrink selected window"),
    Key([mod], "o", lazy.layout.maximize(),                               desc="Maximize selected window" ),
    Key([mod, "shift"], "space", lazy.layout.flip(),                      desc="Flip the master location"),

    Key([mod], "Return", lazy.spawn(terminal),                            desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(),                                 desc="Next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(),                        desc="Previous layout"),
    Key([mod], "space", lazy.window.toggle_floating(),                    desc="Toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(),                      desc="Toggle fullscreen"),
    Key([mod, "shift"], "q", lazy.window.kill(),                          desc="Kill focused window"),
    # Qtile config stuff
    Key([mod, "shift"], "c", lazy.reload_config(),                        desc="Reload the config"),
    Key([mod, "shift"], "e", lazy.shutdown(),                             desc="Exit Qtile"),

    # Screenshot
    Key([], "Print", lazy.spawn("flameshot gui"),                         desc="Open flameshot screenshoter"),

    # Music controller (mpc)
    Key([], "F13", lazy.spawn("mpc prev"),                                desc="Previous song (MPC)"),
    Key([], "F14", lazy.spawn("mpc toggle"),                              desc="Pause/play music (MPC)"),
    Key([], "F15", lazy.spawn("mpc next"),                                desc="Next song (MPC)"),
    Key([], "F16", lazy.spawn("mpc volume -5"),                           desc="Volume -5 (MPC)"),
    Key([], "F17", lazy.spawn("mpc clear"),                               desc="Clear the queue (MPC)"),
    Key([], "F18", lazy.spawn("mpc volume +5"),                           desc="Volume +5 (MPC)"),
    # Playlist control
    Key([], "F19", lazy.spawn("mpc load Weekly"),                         desc="Load the weekly playlist (MPC)"),
    Key(["shift"], "F19", lazy.spawn("mpc load Daily"),                   desc="Load the daily playlist (MPC)"),
    Key([], "F20", lazy.spawn("mpc load This"),                           desc="Load the This playlist (MPC)"),
    Key(["shift"], "F20", lazy.spawn("mpc load That"),                    desc="Load the That playlist (MPC)"),
    Key([], "F21", lazy.spawn("mpc load New_Playlist_2"),                 desc="Load the New Playlist 2playlist (MPC)"),
    Key(["shift"], "F21", lazy.spawn("mpc load New_Playlist_5"),          desc="Load the New Playlist 5 playlist (MPC)"),
    Key([], "F22", lazy.spawn("mpc load favs"),                           desc="Load the favs playlist (MPC)"),
    Key(["shift"], "F22", lazy.spawn("mpc load Lex"),                     desc="Load the Lex playlist (MPC)"),
    Key([], "F23", lazy.spawn("mpc load YTLikesSpotify"),                 desc="Load the YTLikesSpotify playlist (MPC)"),
    Key(["shift"], "F23", lazy.spawn("mpc load SomethingCompletelyDifferent"), desc="Load the SomethingCompletelyDifferent playlist (MPC)"),
    Key([], "F24", lazy.spawn("mpc load Background"),                     desc="Load the Background playlist (MPC)"),
    Key(["shift"], "F24", lazy.spawn("mpc load EDM"),                     desc="Load the EDM playlist (MPC)"),
    Key([mod, "shift"], "F1", lazy.spawn("mpc toggle"),                   desc="Pause/play music (MPC)"),

    # Web browsers
    Key([mod], "t", lazy.spawn(web),                                      desc="Open web browser"),
    Key([mod, "shift"], "t", lazy.spawn("firefox --private-window"),      desc="Open web browser in private window"),

    # Notification
    Key([mod], "n", lazy.spawn("dunstctl history-pop"),                   desc="Show previous notification"),
    Key([mod], "m", lazy.spawn("dunstctl close"),                         desc="Close oldest notification"),
    Key([mod, "shift"], "m", lazy.spawn("dunstctl close-all"),            desc="Close all notification"),

    # Floating
    Key([mod], "F1", lazy.spawn("alacritty -o window.opacity=0.5 --class ranger,floating -e ranger"), desc="Open ranger floating"),
    Key([mod], "F2", lazy.spawn("alacritty -o window.opacity=0.75 --class btop,floating -e btop"), desc="Open btop floating"),
    Key([mod], "F3", lazy.spawn("alacritty -o window.opacity=0.5 --class ncmpcpp,floating -e ncmpcpp"), desc="Open ncmpcpp floating"),
    Key([mod, "shift"], "Return", lazy.spawn("alacritty -o window.opacity=0.5 --class alacritty,floating"), desc="Launch terminal floating"),

    # Screenkey
    Key([mod], "F4", lazy.spawn("screenkey"),                              desc="Open screenkey for screensharing"),
    Key([mod, "shift"], "F4", lazy.spawn("killall screenkey"),             desc="Close screenkey"),

    # Audio control
    # Key([], XF86AudioRaiseVolume, lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Increase volume +5%"),
    # Key([], XF86AudioLowerVolume, lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Increase volume -5%"),

]

games = [Match(wm_class=["Minecraft Launcher"]),
         Match(wm_class=["Minecraft* 1.18.2"]),
         Match(wm_class=["Minecraft* 1.16.5"]),
         Match(wm_class=["Minecraft 1.16.5"]),
         Match(wm_class=["Steam"]),
         Match(wm_class=["polymc"]),
        ]

groups = [Group("1"),
          Group("2", layout="monadwide", matches=[Match(wm_class=["mailspring"])]),
          Group("3"),
          Group("4", layout="monadwide", matches=[Match(wm_class=["discord"]), Match(title="Snapchat")]),
          Group("5"),
          Group("6", layout="monadwide", matches=[Match(wm_class=["obsidian"])]),
          Group("7"),
          Group("8", layout="monadwide"),
          Group("9"),
          Group("0", layout="monadwide"),
          Group("g", matches=games)]


def go_to_group(name: str) -> Callable:
    def _inner(qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in '13579g':
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()

    return _inner

for group in groups:
    keys.append(Key([mod], group.name, lazy.function(go_to_group(group.name)), desc="Switch to group {}".format(group.name)))
    keys.append(Key([mod, 'shift'], group.name, lazy.window.togroup(group.name), desc="Send window to group {}".format(group.name)))

layout_defaults = dict(
    border_focus="#5fd7ff",
    border_normal="#7C7B7B",
    margin=8
)

layouts = [
    layout.MonadTall(**layout_defaults),
    layout.Columns(**layout_defaults),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    layout.Stack(num_stacks=2),
    layout.Bsp(**layout_defaults),
    layout.Matrix(**layout_defaults),
    layout.MonadWide(**layout_defaults, ratio=0.6),
    layout.RatioTile(**layout_defaults),
    layout.Tile(**layout_defaults),
    # layout.TreeTab(**layout_defaults),
    layout.VerticalTile(**layout_defaults),
    # layout.Zoomy(**layout_defaults),
]

widget_defaults = dict(
    font="Hack Nerd Font Mono",
    fontsize=12,
    padding=3,
    background="#080606",
    foreground="#EFEFEF"
)
extension_defaults = widget_defaults.copy()

seperator = widget.Sep()

screens = [
    Screen(top=bar.Bar([ # Left
                       widget.CurrentLayout(),
                       widget.GroupBox(visible_groups=['1', '3', '5', '7', '9', 'g'],
                                       this_screen_border="346F83",
                                       this_current_screen_border="5FD7FF",
                                       urgent_border="F25757"),
                       seperator,
                       widget.Pomodoro(),
                       # Center
                       widget.Spacer(),
                       widget.WindowName(scroll=True, width=1000),
                       widget.Spacer(),
                       # Right
                       widget.CPU(),
                       seperator,
                       widget.Memory(measure_mem='G'),
                       seperator,
                       widget.NvidiaSensors(format='{perf} {temp}°C'),
                       seperator,
                       widget.Net(interface="enp5s0", use_bits=True, prefix="M"),
                       seperator,
                       widget.Clock(format="%a %-H:%M")
                       ], 24),
          wallpaper='~/.config/qtile/Main.png',
          wallpaper_mode='stretch'),
    Screen(top=bar.Bar([ # Left
                       widget.CurrentLayout(),
                       widget.GroupBox(visible_groups=['2', '4', '6', '8', '0'],
                                       this_screen_border="346F83",
                                       this_current_screen_border="5FD7FF",
                                       urgent_border="F25757"),
                       seperator,
                       widget.CheckUpdates(distro='Arch_yay'),
                       # Center
                       widget.Spacer(),
                       widget.Mpd2(),
                       widget.Spacer(),
                       # Right
                       widget.DF(partition='/mnt/storage', visible_on_warn=False),
                       seperator,
                       widget.DF(partition='/', visible_on_warn=False),
                       seperator,
                       widget.Volume(),
                       seperator,
                       widget.Systray()], 24),
          wallpaper='~/.config/qtile/Second.png',
          wallpaper_mode='stretch')
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
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
        Match(wm_class="floating"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False

# Autostart
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

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
