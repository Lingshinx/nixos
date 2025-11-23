#!/usr/bin/env fish

for monitor in (niri msg --json outputs | jq -r '.[] | .name')
  set random (randir ~/.local/state/lingshin/wallpaper/$monitor)
  swww img "$random" --transition-type wipe --outputs "$monitor" --transition-fps 60 --transition-angle 340
end
