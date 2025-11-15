debug: prebuild
  nixos-rebuild switch --flake . --show-trace

build: prebuild
  nixos-rebuild switch --flake .

prebuild:
  build.fish
