{pkgs, ...}: {
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
    mpv
    swayimg
    firefox
    gui-for-singbox
  ];
}
