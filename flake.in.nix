let
  getFile = host: import hosts/${host}/flake.in.nix;
  inherit (import utils/attr.nix) merge;
in {
  inputs = with (import utils/fetch.nix);
    merge (map (host: (getFile host).inputs) hosts)
    // {
      nixpkgs = fetchGithub "NixOS/nixpkgs/nixos-unstable";
      home-manager = fetchFlake "nix-community/home-manager";
      silentSDDM = fetchFlake "lingshinx/SilentSDDM/develop";
      plymouth-theme-lagtrain = fetchFlake "lingshinx/plymouth-theme-lagtrain";
    };

  outputs = {nixpkgs, ...} @ inputs:
    with nixpkgs.lib; {
      nixosConfigurations = let
        hosts = attrnames (filterAttrs (name: type: type == "directory") (builtins.readDir dir));
      in genAttrs hosts (
        host: nixosSystem {
          specialArgs = {inherit inputs; hostName = host;};
          inherit ((getFile host).outputs inputs) modules;
        }
      );
    };
}
