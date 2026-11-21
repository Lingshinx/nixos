let
  inherit (import utils/fs.nix) list basename;
  hosts = basename (list.dirs ./hosts);
in {
  inputs = with (import utils/fetch.nix); {
    nixpkgs = fetchGithub "NixOS/nixpkgs/nixos-unstable";
    home-manager = fetchFlake "nix-community/home-manager";
    silentSDDM = fetchFlake "lingshinx/SilentSDDM/develop";
    plymouth-theme-lagtrain = fetchFlake "lingshinx/plymouth-theme-lagtrain";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (nixpkgs.lib) genAttrs nixosSystem;
    myLib = {
      paths = import ./paths.nix;
      fs = import utils/fs.nix;
    };
  in {
    nixosConfigurations = genAttrs hosts (
      host:
        nixosSystem {
          specialArgs = {
            inherit inputs myLib;
            hostname = host;
          };
          modules = [(import ./hosts/${host}) ./modules];
        }
    );
  };
}
