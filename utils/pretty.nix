with builtins; rec {
  intend = str: "  " + str;

  showBool = x:
    if isBool x
    then "true"
    else "false";

  showList = prefix: xs:
  let
    xs' = map (show' prefix) xs;
    intended = intend prefix;
  in
    if length xs > 5 || any isAttrs xs
    then ''
      [
      ${concatStringsSep "\n" (map (x: intended + show' intended x) xs)}
      ${prefix}]''
    else"[ ${toString xs'} ]";

  mapAttrsToList = f: x: attrValues (mapAttrs f x);



  showAttrs = prefix: x:
  let
    intended = intend prefix;
    showAttr = n: v: intended + n + showChild intended v + ";";
    showChild = prefix: x:
      let
        names = attrNames x;
      in
      if isAttrs x && length names == 1
      then
        let name = head names;
        in "." + name + showChild prefix x.${name}
      else " = " + show' prefix x;
  in ''
    {
    ${concatStringsSep "\n" (mapAttrsToList showAttr x)}
    ${prefix}}'';

  show' = prefix: x:
    if isString x
    then "\"${x}\""
    else if isBool x
    then showBool x
    else if isNull x
    then "null"
    else if isList x
    then showList prefix x
    else if isAttrs x
    then showAttrs prefix x
    else toString x;
}
