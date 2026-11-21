{
  pkgs,
  myLib,
  ...
}: {
  imports = myLib.fs.list.exceptDefault ./.;

  home.packages = with pkgs; [
    kitty
    swayimg
    localsend
    throne
    neovide
  ];

  programs = {
    firefox = {
      enable = true;
      languagePacks = ["zh-CN"];
    };

    mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [modernx thumbfast];
    };
  };
}
