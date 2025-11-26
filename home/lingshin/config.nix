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

  home.stateVersion = "25.05";
}
