{utils, ...}: let
  inherit (utils) listAllFiles;
in {
  imports = listAllFiles ./.;
}
