user: {
  pkgs,
  myLib,
  ...
}: {
  home-manager.users."${user}" = {
    imports = myLib.fs.list.exceptDefault ./.;
    home.stateVersion = "26.05";
  };
  users = {
    users.${user} = {
      shell = pkgs.fish;
      extraGroups = [
        "sudo"
        "networkmanager"
      ];
    };
  };
}
