{
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    lingshin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "path:../../home/lingshin";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    silentSDDM = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:uiriansan/SilentSDDM";
    };
    stylix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/stylix";
    };
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}