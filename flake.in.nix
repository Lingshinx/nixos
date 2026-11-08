let
  inherit (import utils/attr.nix) filterAttrs;
  hosts = builtins.attrNames (filterAttrs (name: type: type == "directory") (builtins.readDir ./hosts));
  getHost = host: import ./hosts/${host}/flake.in.nix;
  inherit (import utils/attr.nix) merge;
in {
  inputs = with (import utils/fetch.nix);
    merge (map (host: (import ./hosts (getHost host)).inputs) hosts)
    // {
      nixpkgs = fetchGithub "NixOS/nixpkgs/nixos-unstable";
      home-manager = fetchFlake "nix-community/home-manager";
      silentSDDM = fetchFlake "lingshinx/SilentSDDM/develop";
      plymouth-theme-lagtrain = fetchFlake "lingshinx/plymouth-theme-lagtrain";
    };

  outputs = {nixpkgs, ...} @ inputs:
    with nixpkgs.lib; {
      nixosConfigurations =genAttrs hosts (
        host: nixosSystem {
          specialArgs = {inherit inputs; hostName = host;};
          modules = (import ./hosts (getHost host)).outputs inputs;
        }
      );
    };
}
