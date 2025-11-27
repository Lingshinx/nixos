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
    firefox
    localsend
    throne

    neovide
  ];

  programs = {
    mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [modernx thumbfast];
    };
  };
}
