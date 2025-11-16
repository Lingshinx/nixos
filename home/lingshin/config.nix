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
  imports = [./cli.nix ./gui.nix ./files.nix];

  home= {
    username = "lingshin";
    homeDirectory = "/home/lingshin";
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
