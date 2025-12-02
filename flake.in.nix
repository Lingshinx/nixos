let
  hosts = ["Azrael"];
  getFile = host: import hosts/${host}/flake.in.nix;
  inherit (import utils/attr.nix) merge;
in {
  inputs = with (import utils/fetch.nix);
    merge (map (host: (getFile host).inputs) hosts)
    // {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager = fetchFlake "nix-community/home-manager";
      nix-index-database = fetchFlake "nix-community/nix-index-database";
      silentSDDM = fetchFlake "lingshinx/SilentSDDM/develop";
      plymouth-theme-lagtrain = fetchFlake "lingshinx/plymouth-theme-lagtrain";
    };

  outputs = {nixpkgs, ...} @ inputs:
    with nixpkgs.lib; {
      nixosConfigurations = genAttrs hosts (
        host:
          nixosSystem {
            specialArgs = {inherit inputs;};
            inherit ((getFile host).outputs inputs) modules;
          }
      );
    };
}
