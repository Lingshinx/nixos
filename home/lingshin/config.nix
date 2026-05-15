{
  imports = [
    ./cli
    ./gui
    ./fonts.nix
    ./time-locale.nix
  ];

  home = {
    username = "lingshin";
    homeDirectory = "/home/lingshin";
  };

  home.stateVersion = "26.05";
}
