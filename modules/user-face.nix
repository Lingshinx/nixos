{
  config,
  lib,
  ...
}:
with builtins;
with lib;
with types; {
  options.users.users = mkOption {
    type = attrsOf (
      submodule ({...}: {
        options.face-icon = mkOption {
          type = nullOr path;
          default = null;
          description = ''
            Avatar file to be shown in sddm for user
          '';
        };
      })
    );
  };

  config.systemd.tmpfiles.rules = with attrsets; let
    content = name: {
      User = {
        Icon = "/var/lib/AccountsService/icons/${name}";
      };
    };
    toINI = generators.toINI {};
    escape = replaceStrings ["\n"] ["\\n"];
    fileContent = name: escape (toINI (content name));
    concatMapAttrsToList = func: attr: concatLists (mapAttrsToList func attr);
  in
    concatMapAttrsToList
    (
      name: value: [
        "f+ /var/lib/AccountsService/users/${name} 0600 root root - ${fileContent name}"
        "L+ /var/lib/AccountsService/icons/${name} - - - - ${value.face-icon}"
      ]
    )
    (
      filterAttrs
      (name: value: value.face-icon != null)
      config.users.users
    );
}
