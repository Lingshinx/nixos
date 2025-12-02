{pkgs, ...}: {
  imports = [
    ./theme.nix
    ./plasma.nix
  ];

  home.packages = with pkgs; [
    # desktop shell
    anyrun
    rofi
    waybar
    wlogout
    swww
    hyprlock

    # utils
    hyprshot
    satty

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
