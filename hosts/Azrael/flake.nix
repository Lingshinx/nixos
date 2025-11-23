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
    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    silentSDDM = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/SilentSDDM/develop";
    };
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}
