{...}: let
  inherit (imports ../utils.nix) listAll;
in {
  imports = listAllFiles ./.;
}
