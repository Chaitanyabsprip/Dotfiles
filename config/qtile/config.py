# Qtile Config File
# http://www.qtile.org/

# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles
import re
import subprocess
from os import path

from libqtile import hook

from settings.groups import groups
from settings.keys import keys, mod
from settings.layouts import floating_layout, layouts
from settings.mouse import mouse
from settings.path import qtile_path
from settings.screens import screens
from settings.widgets import extension_defaults, widget_defaults


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
       (window.window.get_name() == 'Android Virtual Device Manager') or
       (window.window.get_wm_type() == 'dialog') or
       (re.search('note*', window.window.get_name())) or
       (re.search('TODO*', window.window.get_name())) or
       (re.search('Sign*', window.window.get_name())) or
       (False)
       ):
        window.floating = True


@ hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])


main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = 'urgent'
wmname = 'LG3D'
