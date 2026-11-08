with builtins;
let inherit (import ./attr.nix) filterAttrs;
in rec {
  list = pred: dir: map (name: "${toString dir}/${name}") (attrNames (filterAttrs pred (readDir dir)));
  listAll = list (name: type: type == "regular" || type == "directory");
  listAllFiles = list (name: type: type == "regular");
  listAllDirs = list (name: type: type == "directory");
}
