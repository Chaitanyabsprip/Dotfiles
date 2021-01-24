#! /usr/bin/fish

function bi
  brightnessctl -d "intel_backlight" set +5%
end
