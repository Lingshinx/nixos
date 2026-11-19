{
  inputs,
  allOtherModulesAt,
  ...
}: {
  imports = [../modules inputs.home-manager.nixosModules.home-manager];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs allOtherModulesAt;};
    backupFileExtension = "bak";
  };
}
