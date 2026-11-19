{
  pkgs,
  allOtherModulesAt,
  ...
}: {
  imports = allOtherModulesAt ./.;

  home.packages = with pkgs; [
    # application
    kitty
    swayimg
    localsend
    throne

    # social-media
    telegram-desktop

    qbittorrent

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
