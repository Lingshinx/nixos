{
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-25.05";
    };
    lingshin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "path:../../home/lingshin";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    silentSDDM = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:uiriansan/SilentSDDM";
    };
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}