{
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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