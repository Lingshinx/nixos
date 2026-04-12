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
    grim
    slurp
    satty
    zbar
  ];
}
