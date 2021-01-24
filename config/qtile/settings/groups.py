# Chaitanya Sharma
# https://github.com/Chaitanyabsprip

# Qtile workspaces

from libqtile.config import Key, Group, ScratchPad, DropDown
from libqtile.command import lazy
from settings.keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons:
# nf-fa-firefox,
# nf-fae-python,
# nf-dev-terminal,
# nf-fa-code,
# nf-seti-config,
# nf-mdi-folder,
# nf-mdi-image,
# nf-fa-video_camera,
# nf-mdi-layers

myTerm = "alacritty"

group_names = [
    ("  ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
    (" ﭮ ", {'layout': 'monadtall'}),
    ("  ", {'layout': 'monadtall'}),
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

ddconfig = {"x": 0.2, "y": 0.2, "height": 0.6, "width": 0.6,
            "on_focus_lost_hide": True, "warp_pointer": False}

volume_control_panel = myTerm + " -o" + " window.dimensions.columns=80" + \
    " window.dimensions.lines=24" + " -t" + \
    " Volume\ Control" + " -e" + " alsamixer"

groups.append(
    ScratchPad("scratchpad", [
        DropDown("multipurpose", "alacritty",
                 x=0.2,
                 y=0.2,
                 height=0.6,
                 width=0.6,
                 on_focus_lost_hide=True,
                 warp_pointer=False),
        DropDown("music", "vimb music.youtube.com",
                 x=0.1,
                 y=0.1,
                 height=0.8,
                 width=0.8,
                 on_focus_lost_hide=True,
                 warp_pointer=False),
        DropDown("Volume Control", volume_control_panel,
                 x=0.24,
                 y=0.24,
                 height=0.51,
                 width=0.48,
                 on_focus_lost_hide=True,
                 warp_pointer=False),
    ]),
)

keys.extend([
    Key(['mod4'], 't', lazy.group['scratchpad'].dropdown_toggle('multipurpose')),
    Key(['mod4'], 'm', lazy.group['scratchpad'].dropdown_toggle('music')),
    Key(['mod4'], 'v', lazy.group['scratchpad'].dropdown_toggle('Volume Control')),
])
