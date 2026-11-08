with (import ../utils/listFs.nix);
{inputs,...}: {
  imports = listAllFiles ../modules ++
    [inputs.home-manager.nixosModules.home-manager];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "bak";
  };
}
