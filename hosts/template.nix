home: {
  lib,
  myLib,
  ...
}: let
  inherit (lib) mergeAttrsList;
  inherit (myLib.fs) basename list;
  users = basename (list.dirs home);
in
  mergeAttrsList (map (
      user: let
        userModules = import (home + "/${user}") user;
      in {
        imports = [userModules.nixosModules.default];

        users = {
          groups.${user} = {};
          users.${user}.isNormalUser = true;
        };

        home-manager.users."${user}" = {
          imports = [userModules.homeModules.default];

          home = {
            username = user;
            homeDirectory = "/home/${user}";
            stateVersion = "26.05";
          };
        };
      }
    )
    users)
