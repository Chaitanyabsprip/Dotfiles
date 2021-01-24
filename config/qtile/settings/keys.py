# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"
alt = "mod1"
myTerm = "alacritty"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane

    ([mod], "Up", lazy.layout.up()),
    ([mod], "Down", lazy.layout.down()),
    ([mod], "Left", lazy.layout.left()),
    ([mod], "Right", lazy.layout.right()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "l", lazy.layout.right()),
    ([alt], "Tab", lazy.layout.down()),


    # Change window sizes (MonadTall)

    ([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete()),
    ([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete()),
    ([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add()),
    ([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add()),
    ([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster()),
    ([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster()),
    ([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster()),
    ([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster()),


    # Toggle floating
    ([mod, "control"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack

    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "f", lazy.layout.flip()),


    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "x", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawn('rofi ' +
                            '-modi ' +
                            '"Global Search":' +
                            '"~/Downloads/rofi-spotlight/rofi-spotlight.sh" ' +
                            '-show ' +
                            '"Global Search" ' +
                            '-config ' +
                            '~/Downloads/rofi-spotlight/rofi.rasi')),

    # ------------ App Configs ------------

    ([mod, "shift"], "p", lazy.spawn("randomWallpaper")),

    # Menu
    ([mod], "w", lazy.spawn("rofi -show drun -config ~/Downloads/rofi-spotlight/rofi.rasi")),

    # Window Nav
    ([mod, "shift"], "w", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("firefox")),

    # File Explorer
    ([mod], "e", lazy.spawn("nvim")),

    # Discord
    ([mod], "d", lazy.spawn("discord")),

    # Terminal
    ([mod], "Return", lazy.spawn(myTerm)),

    # Notes
    (["control"], "m", lazy.spawn(myTerm +
                                  " -o" +
                                  " window.dimensions.columns=70" +
                                  " window.dimensions.lines=30" +
                                  " -t" +
                                  " notetaker_window" +
                                  " -e" +
                                  " fish" +
                                  " /home/chaitanya/bin/takenote"
                                  )),

    # Notes
    ([mod], "n", lazy.spawn(myTerm +
                            " -o" +
                            " window.dimensions.columns=70" +
                            " window.dimensions.lines=30" +
                            " -t" +
                            " TODO" +
                            " -e" +
                            " fish" +
                            " /home/chaitanya/bin/maketodo"
                            )),

    # Screenshot
    ([mod], "s", lazy.spawn(
        "scrot -q 100 -f '/home/chaitanya/Pictures/Screenshot:%Y-%m-%d.png'")),

    # Shutdown menu
    ([mod, "control"], "s", lazy.spawn("powermenu.sh")),
    # ------------ Hardware Configs ------------

    # Volume
    (
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 10%+"),
        lazy.spawn("amixer -c 0 -q set Speaker unmute"),
        lazy.spawn("amixer -c 0 -q set Headphone unmute"),
    ),
    (
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 10%-"),
        lazy.spawn("amixer -c 0 -q set Speaker unmute"),
        lazy.spawn("amixer -c 0 -q set Headphone unmute"),
    ),
    (
        [], "XF86AudioMute",
        lazy.spawn("amixer -c 0 -q set Master toggle"),
    ),


    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("sudo brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("sudo brightnessctl set 10%-")),
]]
