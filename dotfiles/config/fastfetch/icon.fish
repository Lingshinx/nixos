#!/usr/bin/env fish

if string match '*kitty' $TERM --quiet
    randir ~/.config/lingshin/fastfetch-icons
else
    echo hello
end
