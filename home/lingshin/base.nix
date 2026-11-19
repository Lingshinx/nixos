{pkgs, ...}: {
  home-manager.users.lingshin = import ./config.nix;

  users = {
    groups.lingshin = {};
    users.lingshin = {
      isNormalUser = true;
      shell = pkgs.fish;
      face-icon = ../../assets/avatars/lingshin;
      extraGroups = [
        "sudo"
        "networkmanager"
        "rtkit"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAftXR5kzi4fx0RQJHCQzR8iCNIm6YSMjshl8Z6a2/jG lingshin@Avalon"
      ];
    };
  };
}
