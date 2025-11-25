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
    plymouth-theme-lagtrain = fetchFlake "lingshinx/plymouth-theme-lagtrain";
  };

  outputs = {
    lingshin,
    home-manager,
    nix-index-database,
    ...
  } @ inputs:
    with import ../../utils/listFs.nix;
    with builtins; {
      specialArgs = {inherit inputs;};
      modules = concatLists [
        (listAllFiles ../../system)
        (listAllFiles ../../modules)
        [
          lingshin.nixosModules.default

          ./hardware.nix
          ./plasma.nix

          nix-index-database.nixosModules.nix-index

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              backupFileExtension = "bak";
            };
          }

          ({...}: {system.stateVersion = "25.11";})
        ]
      ];
    };
}
