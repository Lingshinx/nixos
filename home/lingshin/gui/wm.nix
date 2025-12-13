{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop shell
    anyrun
    rofi
    waybar
    wlogout
    swww
    hyprlock

    wl-clipboard
    cliphist

    # utils
    hyprshot
    satty
  ];
}
