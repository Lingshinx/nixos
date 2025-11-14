{
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (import ./utils.nix) listAllDirs listAllFiles listAddValue;
    hosts = map basename (listAllDirs ./hosts);
  in {
    nixosConfigurations =
      listAddValue
      (host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
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
