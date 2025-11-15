# Do not modify! This file is generated.

{
  inputs = {
    flakegen.url = "github:jorsn/flakegen";
    lazy-nvim = {
      flake = false;
      url = "github:folke/lazy.nvim?rev=stable";
    };
    mpv-modernx = {
      flake = false;
      url = "github:cyl0/ModernX";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/nvim-config";
    };
  };
  outputs = inputs: inputs.flakegen ./flake.in.nix inputs;
}