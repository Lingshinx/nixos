{
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (builtins) baseNameOf;
    customUtils = import ./utils.nix {inherit nixpkgs;};
    inherit (customUtils) listAllDirs listAllFiles;
    inherit (nixpkgs.lib.attrsets) genAttrs;
    hosts = map baseNameOf (listAllDirs ./hosts);
  in {
    nixosConfigurations =
      genAttrs
      hosts
      (host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs customUtils;};
          modules = [
            (import "${home-manager}/nixos")
            ./hosts/${host}
          ];
        });
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
