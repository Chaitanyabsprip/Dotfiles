from libqtile import widget
from . import theme

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


def base(fg='text', bg='dark'):
    return {
        'foreground': theme.colors[fg],
        'background': theme.colors[bg]
    }


def separator(fg='text', bg='dark'):
    return widget.Sep(**base(fg, bg), linewidth=0, padding=10)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


# def powerline(fg='light', bg='dark'):
#     return widget.TextBox(
#         **base(fg, bg),
#         text="",
#         width=28,
#         font='FiraCode Nerd Font',
#         fontsize=26,
#         padding=-4
#     )


def powerline(fg='light', bg='dark'):
    return widget.TextBox(
        **base(fg, bg),
        text="",
        width=28,
        font='FiraCode Nerd Font',
        fontsize=30,
        padding=-4
    )


def workspaces(): return [
    separator(),
    widget.GroupBox(
        **base(fg='light'),
        font='FiraCode Nerd Font',
        fontsize=19,
        margin_y=3,
        margin_x=0,
        padding_y=8,
        padding_x=5,
        borderwidth=1,
        active=theme.colors['active'],
        inactive=theme.colors['inactive'],
        rounded=False,
        highlight_method='block',
        urgent_alert_method='block',
        urgent_border=theme.colors['urgent'],
        this_current_screen_border=theme.colors['focus'],
        this_screen_border=theme.colors['grey'],
        other_current_screen_border=theme.colors['dark'],
        other_screen_border=theme.colors['dark'],
        disable_drag=True
    ),
    separator(),
    widget.CurrentLayoutIcon(**base(bg='dark'), scale=0.65),

    widget.CurrentLayout(**base(bg='dark'), padding=5),
    separator(),
    widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    separator(),
]


primary_widgets = [
    *workspaces(),
    powerline('color4', 'dark'),
    separator(fg='color4', bg='color4'),
    icon(bg="color4", text=' '),  # Icon: nf-fa-feed
    widget.Net(**base(bg='color4'), interface='wlp0s20f3',
               format='{down} ↓↑ {up}',),
    powerline('color3', 'color4'),
    icon(bg='color3', text='', fontsize=12),
    widget.Battery(
        format="{percent:2.0%}", **base(bg='color3'),),
    powerline('color2', 'color3'),
    icon(bg="color2", fontsize=26, text=' '),  # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg='color2'), format='%H:%M%d/%m',
                 font='FiraCode Nerd Font Mono Bold'),
    powerline('color1', 'color2'),
    widget.Systray(
        background=theme.colors['color1'], padding=12, icon_size=16),
    separator(fg='color1', bg='color1')
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color1', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    widget.CurrentLayout(**base(bg='color1'), padding=5),
]

widget_defaults = {
    'font': 'FiraCode Nerd Font Retina',
    'fontsize': 14,
    'padding': 2,
}

extension_defaults = widget_defaults.copy()
