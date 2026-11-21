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
  openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAftXR5kzi4fx0RQJHCQzR8iCNIm6YSMjshl8Z6a2/jG lingshin@Avalon"
  ];
}
