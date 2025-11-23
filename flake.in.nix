let
  hosts = ["Azrael"];
in {
  outputs = {nixpkgs, ...} @ inputs:
    with nixpkgs.lib; {
      nixosConfigurations = genAttrs hosts (
        host: nixosSystem {inherit (inputs."${host}") specialArgs modules;}
      );
    };

  inputs = with builtins;
    listToAttrs (map (name: {
        inherit name;
        value = {
          url = "path:./hosts/${name}";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      })
      hosts)
    // {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };
}
