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
  assets = path: ../../assets + path;
in {
  imports = [./cli.nix ./gui.nix];

  home.file = {
    ".config" = sourceDir ../../dotfiles/config;

    "Pictures/Wallpapers" = sources (assets wallpapers);
  };

  xdg.configFile = let
    modernx = sources.mpv-modernx;
    font = "Material-Design-Iconic-Font.ttf";
  in {
    "mpv/fonts/${font}".source = "${modernx}/${font}";
    "mpv/scripts/modernx.lua".source = "${modernx}/modernx.lua";

    nvim = sourceDir sources.nvim;

    "lingshin/wallpaper/lock.png" = assets "lock.png";
    "lingshin/wallpaper/transparent" = assets "transparent.png";
  };

  xdg.dataFile = {
    "nvim/lazy/lazy-nvim" = sourceDir sources.lazy-nvim;
  };
}
