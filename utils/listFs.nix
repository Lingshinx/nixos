with builtins;
let
  filterAttrs = f: xs: listToAttrs (filter (attr: f attr.name attr.value) (map (name: {inherit name; value = xs.${name};}) (attrNames xs)));

in rec {
  list = pred: dir: map (name: "${toString dir}/${name}") (attrNames (filterAttrs (pred) (readDir dir)));
  listAll = list (name: type: type == "regular" || type == "directory");
  listAllFiles = list (name: type: type == "regular");
  listAllDirs = list (name: type: type == "directory");
}
