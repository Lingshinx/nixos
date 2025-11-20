{config, lib, ...}:

with builtins;
with lib;
with types;

{
  options.users.users = mkOption {
    type = attrsOf (
      submodule ({name, config, ...}:{
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

  config.systemd.tmpfiles.rules =
    with attrsets;
    mapAttrsToList
    (name: value:
      "L+ /var/lib/AccountsService/icons/${name} - - - - ${value.face-icon}"
    )
    (
      filterAttrs
      (name: value: value.face-icon != null)
      config.users.users
    );
}
