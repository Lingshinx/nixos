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

    silentSDDM = fetchFlake "uiriansan/SilentSDDM";
    stylix = fetchFlake "nix-community/stylix";
  };

  outputs = {
    nixpkgs,
    lingshin,
    home-manager,
    stylix,
    ...
  } @ inputs:
    with import ../../utils/listFs.nix {inherit nixpkgs;};
    with builtins;
      {
        specialArgs = {inherit inputs;};
        modules = concatLists [
          (listAllFiles ../../system)
          lingshin.modules
          [
            "${home-manager}/nixos"
            ./hardware.nix
            stylix.nixosModules.stylix
            ({...}: {system.stateVersion = "25.11";})
          ]
        ];
      };
}
