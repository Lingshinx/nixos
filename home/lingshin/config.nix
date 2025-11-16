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

  xdg.configFile = let
    modernx = sources.mpv-modernx;
    font = "Material-Design-Iconic-Font.ttf";
  in {
    "mpv/fonts/${font}".source = "${modernx}/${font}";
    "mpv/scripts/modernx.lua".source = "${modernx}/modernx.lua";

    nvim = sourceDir sources.nvim;
  };

  xdg.dataFile = {
    "nvim/lazy/lazy-nvim" = sourceDir sources.lazy-nvim;
  };

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
