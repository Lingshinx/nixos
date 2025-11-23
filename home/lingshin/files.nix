{
  pkgs,
  inputs,
  ...
}: let
  sources = inputs.lingshin.inputs;
  assets = path: "${../../assets}/${path}";
  configPath = ../../dotfiles/config;
  config = path: "${configPath}/${path}";
in {
  imports = [./cli.nix ./gui.nix];

  home.file = {
    "Pictures/Wallpapers".source = assets "wallpapers";
  };

  xdg.configFile = let
    modernx = sources.mpv-modernx;
    font = "Material-Design-Iconic-Font.ttf";
  in
    with builtins;
      {
        "mpv/fonts/${font}".source = "${modernx}/${font}";
        "mpv/scripts/modernx.lua".source = "${modernx}/modernx.lua";
      }
      // pkgs.lib.genAttrs (attrNames (readDir configPath)) (
        path: {
          source = config path;
          recursive = elem path ["anyrun" "waybar"];
        }
      );
}
