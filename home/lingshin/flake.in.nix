with builtins;
with (import ../../utils/fetch.nix); {
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim = fetchFlake "lingshinx/nvim-config/flake";
  };

  outputs = {...}: {
    modules = [
      ./base.nix
    ];
  };
}
