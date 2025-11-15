{
  pkgs,
  inputs,
  ...
}: let
  sourceDir = dir: {
    source = dir;
    recursive = true;
  };
in {
  home.username = "lingshin";
  home.homeDirectory = "/home/lingshin";

  imports = [./cli.nix ./gui.nix];

  home.file = {
    ".config" = sourceDir ../../dotfiles/config;
    nvim = sourceDir inputs.lingshin.nvim;
  };

  xdg.configFile = {
    mpv = sourceDir inputs.lingshin.mpv-modernx;
  };

  xdg.dataFile = {
    "nvim/lazy/lazy-nvim" = sourceDir inputs.lingshin.lazy-nvim;
  };

  programs = {
    git = {
      enable = true;
      userName = "lingshin";
      userEmail = "yokaringx@outlook.com";
    };

    home-manager.enable = true;
  };

  home.stateVersion = "25.05";
}
