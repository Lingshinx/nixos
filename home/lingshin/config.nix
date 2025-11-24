{...}: let
in {
  imports = [
    ./cli.nix
    ./gui.nix
    ./files.nix
    ./fonts.nix
  ];

  home = {
    username = "lingshin";
    homeDirectory = "/home/lingshin";
  };

  dconf.settings = {};

  programs = {
    git = {
      enable = true;
      settings.user = {
        name = "lingshin";
        email = "yokaringx@outlook.com";
      };
    };

    home-manager.enable = true;
  };

  home.stateVersion = "25.05";
}
