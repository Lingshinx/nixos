with builtins;
with (import ../../utils/fetch.nix); {
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim = fetchFlake "lingshinx/nvim-config/flake";
    home-manager = fetchFlake "nix-community/home-manager";
    plasma-manager = fetchHomeManager "nix-community/plasma-manager";
  };

  outputs = {...}: {
    nixosModules.default = ./base.nix;
  };
}
