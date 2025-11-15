# Do not modify! This file is generated.

{
  inputs = {
    flakegen.url = "github:jorsn/flakegen";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-25.05";
    };
    lingshin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "path:../../home/lingshin";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };
  outputs = inputs: inputs.flakegen ./flake.in.nix inputs;
}