{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop shell
    anyrun
    rofi
    waybar
    wlogout
    awww
    hyprlock

    wl-clipboard
    cliphist

    # utils
    hyprshot
    satty
  ];
}
