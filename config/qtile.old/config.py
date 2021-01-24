# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from libqtile.config import KeyChord, Key, Screen, Group, Drag, Click, Match
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from libqtile.command import lazy
from typing import List  # noqa: F401

mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
alt = "mod1"
ctrl = "control"
shift = "shift"
myTerm = "alacritty"                             # My terminal of choice
home = os.path.expanduser('~')


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


keys = [

    # Launch terminal, kill window, restart and exit Qtile

    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "x", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod, "control"], "s", lazy.spawn("powerspec.sh")),

    # Toggle layouts

    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    # Change window focus

    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),
    Key([alt], "Tab", lazy.layout.down()),

    # Resize layout

    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete()),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete()),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add()),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add()),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster()),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster()),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster()),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster()),

    # switch place of windows (left/right/bottom/up)

    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "f", lazy.layout.flip()),

    # Toggle between different layouts as defined below

    Key([mod], "r", lazy.spawncmd()),

    # CUSTOM APP BINDINGS

    Key([mod], "e", lazy.spawn(myTerm + " -o" + "window.startup_mode=maximized"
                               + " -e" + " nvim")),
    Key([mod], "d", lazy.spawn("discord")),
    Key([mod], "b", lazy.spawn("google-chrome")),
    Key(["control"], "m", lazy.spawn(myTerm +
                                     " -o" +
                                     " window.dimensions.columns=70" +
                                     " window.dimensions.lines=30" +
                                     " -t" +
                                     " notetaker_window" +
                                     " -e" +
                                     " fish" +
                                     " /home/chaitanya/.notetaker"
                                     )),


    Key([mod, "mod1"], "space", lazy.spawn(
        "rofi -modi drun -show drun -show-icons")),
    Key([mod, "mod1"], "c", lazy.spawn("rofi -show emoji -modi emoji")),
    Key([mod, "mod1"], "v", lazy.spawn("rofi-locate")),

    # Volume Keys

    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 10%+"),
        lazy.spawn("amixer -c 0 -q set Speaker unmute"),
        lazy.spawn("amixer -c 0 -q set Headphone unmute"),
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 10%-"),
        lazy.spawn("amixer -c 0 -q set Speaker unmute"),
        lazy.spawn("amixer -c 0 -q set Headphone unmute"),
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -c 0 -q set Master toggle"),
    ),
]

group_names = [("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               (".", {'layout': 'monadtall'}),
               ("..", {'layout': 'monadtall'}),
               ("...", {'layout': 'max'}),
               ("....", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layout_theme = {"border_width": 2,
                "margin": 14,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
]

colors = [["#282c34", "#282c34"],  # panel background
          ["#434758", "#434758"],  # background for current screen tab
          ["#ffffff", "#ffffff"],  # font color for group names
          ["#ff5555", "#ff5555"],  # border line color for current tab
          ["#668bd7", "#668bd7"],  # color for the even widgets
          ["#8d62a9", "#8d62a9"],  # border line color for other tab and odd widgets
          ["#e1acff", "#e1acff"]]  # window name

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font='FiraCode Nerd Font Mono',
    fontsize=12,
    padding=3,
    background=colors[2]
)

extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.GroupBox(
            font="FiraCode Nerd Font Mono Bold",
            fontsize=24,
            margin_y=4,
            margin_x=4,
            padding_y=0,
            padding_x=12,
            borderwidth=0,
            active=colors[2],
            inactive=colors[2],
            rounded=True,
            highlight_color=colors[1],
            highlight_method="line",
            this_current_screen_border=colors[3],
            this_screen_border=colors[4],
            other_current_screen_border=colors[0],
            other_screen_border=colors[0],
            foreground=colors[2],
            background=colors[0]
        ),
        widget.Prompt(
            prompt=prompt,
            font="FiraCode Nerd Font Mono Retina",
            padding=10,
            foreground=colors[2],
            background=colors[1]
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[0],
            background=colors[1],
            padding=4,
            scale=0.7
        ),
        widget.CurrentLayout(
            foreground=colors[2],
            background=colors[1],
            padding=5
        ),
        widget.Sep(
            linewidth=0,
            padding=40,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.WindowName(
            foreground=colors[6],
            background=colors[0],
            padding=0
        ),
        widget.TextBox(
            text='',
            background=colors[0],
            foreground=colors[5],
            width=20,
            fontsize=50
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
            background=colors[5]
        ),
        widget.Net(
            interface="wlp0s20f3",
            format='{down} ↓↑ {up}',
            foreground=colors[2],
            background=colors[5],
            padding=5
        ),
        widget.TextBox(
            text='',
            background=colors[5],
            foreground=colors[4],
            width=20,
            fontsize=50
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
            background=colors[4]
        ),
        widget.TextBox(
            text='墳',
            background=colors[4],
            foreground=colors[2],
            padding=8,
            fontsize=26
        ),
        widget.TextBox(
            text="Vol:",
            foreground=colors[2],
            background=colors[4],
            padding=0
        ),
        widget.Volume(
            foreground=colors[2],
            background=colors[4],
            padding=5
        ),
        widget.TextBox(
            text='',
            background=colors[4],
            foreground=colors[5],
            width=20,
            fontsize=50
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
            background=colors[5]
        ),
        widget.TextBox(
            text='',
            background=colors[5],
            foreground=colors[2],
            padding=8,
            fontsize=16
        ),
        widget.Battery(
            format="{percent:2.0%} {hour:d}h{min:02d}",
            foreground=colors[2],
            background=colors[5],
        ),
        widget.TextBox(
            text='',
            background=colors[5],
            foreground=colors[4],
            width=20,
            fontsize=50
        ),
        widget.Clock(
            foreground=colors[2],
            background=colors[4],
            padding=4,
            format=" %A, %B %d  [ %H:%M ]"
        ),
        widget.Systray(
            background=colors[5],
            padding=10
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
            background=colors[5]
        ),
    ]
    return widgets_list


screens = [
    Screen(
        top=bar.Bar(
            init_widgets_list(),
            24, opacity=0.9,
        ),
        # wallpaper='/home/chaitanya/Pictures/Wallpapers/firewatch-minimalism-0u.jpg',
        # wallpaper_mode='fill'
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    Match(wm_type='utility'),
    Match(wm_type='notification'),
    Match(wm_type='toolbar'),
    Match(wm_type='splash'),
    Match(wm_type='dialog'),
    Match(wm_class='file_progress'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"


@ hook.subscribe.client_new
def floating_dialogs(window):
    dialog = window.window.get_wm_type() == 'dialog'
    transient = window.window.get_wm_transient_for()
    if dialog or transient:
        window.floating = True


@ hook.subscribe.client_new
def idle_dialogues(window):
    if((window.window.get_name() == 'Search Dialog') or
       (window.window.get_name() == 'Module') or
       (window.window.get_name() == 'Goto') or
       (window.window.get_name() == 'IDLE Preferences') or
       (window.window.get_name() == 'Stacer') or
       (window.window.get_wm_type() == 'dialog') or
       (window.window.get_name() == 'notetaker_window')):
        window.floating = True


@ hook.subscribe.startup_once
def start_once():
    subprocess.call(['fish', '/home/chaitanya/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
