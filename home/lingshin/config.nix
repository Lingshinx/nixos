{
  imports = [
    ./cli
    ./gui
    ./fonts.nix
    ./time-locale.nix
    ./pkg-mngr.nix
  ];

  home = {
    username = "lingshin";
    homeDirectory = "/home/lingshin";
  };

  home.stateVersion = "26.05";
}
