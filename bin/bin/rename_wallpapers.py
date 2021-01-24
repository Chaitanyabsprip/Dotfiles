from pathlib import Path
from os import rename

wallpaper_dir = Path('/home/chaitanya/Pictures/Dracula Theme/')
wallpaper_list = wallpaper_dir.rglob('*')

i = 0
for wallpaper in wallpaper_dir.iterdir():
    i += 1
    if wallpaper.is_file():
        old_ext = wallpaper.suffix
        dir = wallpaper.parent
        new_name = f'{dir}/{i}{old_ext}'
        wallpaper.rename(new_name)
