with builtins;
with (import ../../utils/fetch.nix); {
  inputs = {
    nixpkgs = fetchGitHub "NixOS/nixpkgs/nixos-unstable";
    home-manager = fetchFlake "nix-community/home-manager";
  };

  outputs = {...}: {
    nixosModules.default = ./base.nix;
  };
}
