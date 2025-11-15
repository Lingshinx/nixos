# Do not modify! This file is generated.

{
  inputs = {
    Azrael = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "path:./hosts/Azrael";
    };
    flakegen.url = "github:jorsn/flakegen";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };
  outputs = inputs: inputs.flakegen ./flake.in.nix inputs;
}