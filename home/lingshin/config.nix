{...}: let
in {
  imports = [
    ./cli
    ./gui
    ./files.nix
    ./fonts.nix
    ./time-locale.nix
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
