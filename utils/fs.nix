with builtins; let
  inherit (import ./attr.nix) filterAttrs;
  list = pred: dir: map (name: "${toString dir}/${name}") (attrNames (filterAttrs pred (readDir dir)));
  last = list: elemAt list (length list - 1);
  basename = filename: last (split "/" filename);
  except = exceptions: list (name: type: !(elem name exceptions));
in {
  list = {
    all = list (name: type: type == "regular" || type == "directory");
    files = list (name: type: type == "regular");
    dirs = list (name: type: type == "directory");
    except = except;
    exceptDefault = except ["default.nix"];
  };
  basename = filename:
    if isString filename
    then basename filename
    else if isList filename
    then map basename filename
    else throw "function basename applied to ${typeof filename}";
}
