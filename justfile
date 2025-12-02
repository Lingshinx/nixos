set shell := ["fish", "-c"]

check argu = "" : prebuild
  nix flake check {{argu}}

build argu = "": prebuild
  sudo nixos-rebuild switch --flake . {{argu}}

update: prebuild
  nix flake update --flake (realpath .)

prebuild:
  ./build.fish
