{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    grim
    slurp
    satty
    zbar
  ];
}
