{
  pkgs,
  inputs,
  ...
}: let
  sourceDir = dir: {
    source = "${dir}";
    recursive = true;
  };

  sources = inputs.lingshin.inputs;
in {
  home.username = "lingshin";
  home.homeDirectory = "/home/lingshin";
  imports = [./cli.nix ./gui.nix];

  home.file = {
    ".config" = sourceDir ../../dotfiles/config;
  };

  xdg.configFile = {
    mpv = sourceDir sources.mpv-modernx;
    nvim = sourceDir sources.nvim;
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
