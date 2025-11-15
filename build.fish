#!/usr/bin/env nix-shell
#! nix-shell -i fish -p fd

for flake in (fd '^flake.in.nix$' -X dirname)
  cp (nix eval --raw $flake#nextFlake) $flake/flake.nix
end


