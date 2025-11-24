{pkgs, ...}: let
  configPath = ../../dotfiles/config;
  config = path: "${configPath}/${path}";
in {
  xdg.configFile = with builtins;
    pkgs.lib.genAttrs (attrNames (readDir configPath)) (
      path: {
        source = config path;
        recursive = elem path ["anyrun" "waybar"];
      }
    );
}
