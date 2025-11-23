{
  pkgs,
  inputs,
  ...
}: let
  sources = inputs.lingshin.inputs;
  assets = path: "${../../assets}/${path}";
  configPath = ../../dotfiles/config;
  config = path: "${configPath}/${path}";

  inherit (import ../../utils/listFs.nix) listAll listAllDirs listAllFiles;
in {
  imports = [./cli.nix ./gui.nix];

  home.file = {
    "Pictures/Wallpapers".source = assets "wallpapers";
  };

  xdg.configFile = let
    modernx = sources.mpv-modernx;
    font = "Material-Design-Iconic-Font.ttf";
  in {
    "mpv/fonts/${font}".source = "${modernx}/${font}";
    "mpv/scripts/modernx.lua".source = "${modernx}/modernx.lua";
  } // pkgs.lib.genAttrs (map baseNameOf (listAll configPath)) (
    path: {source = config path;}
  );

}
