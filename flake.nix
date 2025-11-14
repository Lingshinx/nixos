{
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (builtins) baseNameOf;
    utils = import ./utils.nix {inherit nixpkgs;};
    inherit (utils) listAllDirs listAllFiles listAddValue;
    hosts = map baseNameOf (listAllDirs ./hosts);
  in {
    nixosConfigurations =
      listAddValue
      (host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs utils;};
          modules = [
            (import "${home-manager}/nixos")
            ./hosts/${host}
          ];
        })
      hosts;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
