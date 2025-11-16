set shell := ["fish", "-c"]

check argu = "" : prebuild
  nix flake check {{argu}}

build: prebuild
  sudo nixos-rebuild switch --flake .

update: updatehost
  nix flake update --flake (realpath .)

updatehost host = "Azrael": updatehome
  nix flake update --flake (realpath hosts/{{host}})

updatehome user = "lingshin": prebuild
  nix flake update --flake (realpath home/{{user}})

prebuild:
  ./build.fish
