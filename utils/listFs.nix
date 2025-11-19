with builtins;
let
  filterAttrs = f: xs: listToAttrs (filter (attr: f attr.name attr.value) (map (name: {inherit name; value = xs.${name};}) (attrNames xs)));

in rec {
  listAll = filetype: dir: map (name: "${toString dir}/${name}") (attrNames (filterAttrs (name: type: type == filetype) (readDir dir)));
  listAllFiles = listAll "regular";
  listAllDirs = listAll "directory";
}
