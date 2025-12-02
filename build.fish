#!/usr/bin/env nix-shell
#! nix-shell -i fish -p fd

cp (nix eval --impure --raw --expr "import ./utils/flakegen.nix ./flake.in.nix") flake.nix
