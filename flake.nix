{
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/nvim-config/flake";
    };
    plasma-manager = {
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/plasma-manager";
    };
    plymouth-theme-lagtrain = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/plymouth-theme-lagtrain";
    };
    silentSDDM = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/SilentSDDM/develop";
    };
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}