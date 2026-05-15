{pkgs, ...}: {
  imports = [
    ./theme.nix
    ./plasma.nix
    ./xdg.nix
    ./wm.nix
  ];

  home.packages = with pkgs; [
    # application
    kitty
    swayimg
    localsend
    throne

    # social-media
    telegram-desktop
    qq
    fluffychat
    element-desktop

    piliplus

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
