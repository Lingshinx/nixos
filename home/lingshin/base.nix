{
  pkgs,
  inputs,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.lingshin = import ./config.nix;
    backupFileExtension = "bak";
  };

  users = {
    groups.lingshin = {};
    users.lingshin = {
      isNormalUser = true;
      shell = pkgs.fish;
      group = "lingshin";
      extraGroups = [
        "sudo"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAftXR5kzi4fx0RQJHCQzR8iCNIm6YSMjshl8Z6a2/jG lingshin@Avalon"
      ];
    };
  };
}
