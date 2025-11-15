{
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = nixpkgs.lib.genAttrs ["Azrael"] (
      host: nixpkgs.lib.nixosSystem inputs."${host}"
    );
  };

  inputs = builtins.deepSeq (with builtins;
    listToAttrs (map (name: {
      inherit name;
      value = {
        url = "path:./hosts/${name}";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    }) ["Azrael"])
    // {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    });
}
