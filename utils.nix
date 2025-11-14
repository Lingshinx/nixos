let
  inherit (builtins) readDir toPath map filter toString attrNames listToAttrs;
  inherit ((import <nixpkgs> {}).lib) filterAttrs;
in
  rev {
    listAll = filetype: dir: map (name: "${toString dir}/${name}") (attrNames (filterAttrs (name: type: type == filetype) (readDir dir)));
    listAllFiles = listAll "regular";
    listAllDirs = listAll "directory";

    listAddValue = f: list:
      listToAttrs (
        map (item: {
          name = item;
          value = f item;
        })
        list
      );
  }
