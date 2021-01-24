#! /usr/bin/fish

function bset -a brightness
  brightnessctl -d "intel_backlight" set $brightness
end
