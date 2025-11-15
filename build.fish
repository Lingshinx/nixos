#!/usr/bin/env nix-shell
#! nix-shell -i fish -p fd

for flake in (fd '^flake.in.nix$' -X dirname)
  cp (nix eval --impure --raw --expr "import ./utils/flakegen.nix $flake/flake.in.nix") $flake/flake.nix
end
