let
  users = ["lingshin"];
  inherit (import ../../utils/attr.nix) merge;
  getFile = user: import ../../home/${user}/flake.in.nix;
in {
  inputs = merge (map (user: (getFile user).inputs) users);

  outputs = {
    home-manager,
    nix-index-database,
    ...
  } @ inputs:
    with import ../../utils/listFs.nix;
    with builtins; {
      modules = concatLists [
        (listAllFiles ../../system)
        (listAllFiles ../../modules)
        (map (user: ((getFile user).outputs inputs).nixosModules.default) users)
        [
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

          ({...}: {
            system.stateVersion = "25.11";
            nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
          })
        ]
      ];
    };
}
