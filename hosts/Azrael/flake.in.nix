let
  fetchHome = user: {
    url = "path:../../home/${user}";
    inputs.nixpkgs.follows = "nixpkgs";
  };
in {
  inputs = with (import ../../utils/fetch.nix); {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = fetchFlake "nix-community/home-manager";
    lingshin = fetchHome "lingshin";

    nix-index-database = fetchFlake "nix-community/nix-index-database";
    silentSDDM = fetchFlake "lingshinx/SilentSDDM/develop";
    stylix = fetchFlake "nix-community/stylix";
  };

  outputs = {
    nixpkgs,
    lingshin,
    home-manager,
    nix-index-database,
    stylix,
    ...
  } @ inputs:
    with import ../../utils/listFs.nix;
    with builtins;
      {
        specialArgs = {inherit inputs;};
        modules = concatLists [
          (listAllFiles ../../system)
          (listAllFiles ../../modules)
          lingshin.modules
          [
            ./hardware.nix
            ({...}: {system.stateVersion = "25.11";})

            "${home-manager}/nixos"
            nix-index-database.nixosModules.nix-index
            stylix.nixosModules.stylix
          ]
        ];
      };
}
