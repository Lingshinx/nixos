{nixpkgs, ...}: let
  inherit (builtins) readDir toPath map filter toString attrNames listToAttrs;
  inherit (nixpkgs.lib) filterAttrs;
in rec {
  listAll = filetype: dir: map (name: "${toString dir}/${name}") (attrNames (filterAttrs (name: type: type == filetype) (readDir dir)));
  listAllFiles = listAll "regular";
  listAllDirs = listAll "directory";
}
