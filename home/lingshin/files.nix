{
  pkgs,
  inputs,
  ...
}: let
  sourceDir = dir: {
    source = "${dir}";
    recursive = false;
  };

  sources = inputs.lingshin.inputs;
  assets = path: "${../../assets}/${path}";
  configPath = ../../dotfiles/config;
  config = path: "${configPath}/${path}";

  inherit (import ../../utils/listFs.nix) listAllDirs listAllFiles;
in {
  imports = [./cli.nix ./gui.nix];

  home.file = {
    "Pictures/Wallpapers" = sourceDir (assets "wallpapers");
  };

  xdg.configFile = let
    modernx = sources.mpv-modernx;
    font = "Material-Design-Iconic-Font.ttf";
  in with builtins; {
    "mpv/fonts/${font}".source = "${modernx}/${font}";
    "mpv/scripts/modernx.lua".source = "${modernx}/modernx.lua";

    # "lingshin/wallpaper/lock.png".source = assets "lock.png";
    # "lingshin/wallpaper/transparent".source = assets "transparent.png";
  } // pkgs.lib.genAttrs (map baseNameOf (listAllDirs configPath)) (
    path: sourceDir (config path)
  ) // pkgs.lib.genAttrs (map baseNameOf (listAllFiles configPath)) (
    path: {source = config path;}
  );

  xdg.dataFile = {
    "nvim/lazy/lazy-nvim" = sourceDir sources.lazy-nvim;
  };
}
