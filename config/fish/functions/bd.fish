#! /usr/bin/fish

function bd
  brightnessctl -d "intel_backlight" set 5%-
end
