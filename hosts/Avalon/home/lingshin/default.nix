user: {
  homeModules.default = {
  };
  nixosModules.default = {myLib, ...}: let
    inherit (myLib) paths;
  in {
    imports = [(import (paths.users user) user)];
    users.users.${user} = {
      face-icon = paths.avatars user;
      extraGroups = ["rtkit"];
    };
  };
}
