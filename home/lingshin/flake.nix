{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/nvim-config/flake";
    };
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}