let
  fetchHome= user: {
    url = "path:../../home/${user}";
    inputs.nixpkgs.follows = "nixpkgs";
  };
in {
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lingshin = fetchHome "lingshin";
  };

  outputs = {
    nixpkgs,
    lingshin,
    home-manager,
    ...
  } @ inputs:
    with import ../../utils.nix {inherit nixpkgs;};
    with builtins;
      {
        specialArgs = {inherit inputs;};
        modules = concatLists [
          (listAllFiles ../../system)
          lingshin.modules
          [
            "${home-manager}/nixos"
            ./hardware.nix
            ({...}: {system.stateVersion = "25.11";})
          ]
        ];
      };
}
