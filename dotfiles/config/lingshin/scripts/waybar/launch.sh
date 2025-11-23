#!/usr/bin/env fish

set dir ~/.cache/lingshin/waybar

set cur_monitor (niri msg --json focused-output | jq -r .name)
set way_monitor (jq -r .output < $dir/monitor.jsonc)

not pkill waybar || test $cur_monitor != $way_monitor && begin
  echo '{ "output": "'$cur_monitor'" }' >$dir/monitor.jsonc

  waybar
end
