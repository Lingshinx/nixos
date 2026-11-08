with builtins;
{
  merge = foldl' (a: b: a // b) {};
  filterAttrs = f: xs:
    listToAttrs (filter (attr: f attr.name attr.value) (map (name: {
      inherit name;
      value = xs.${name};
    }) (attrNames xs)));
}
