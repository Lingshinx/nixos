{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop shell
    waybar
    wlogout
    awww

    wl-clipboard
    cliphist

    # utils
    grim
    slurp
    satty
    zbar
  ];
}
