{pkgs, ...}: {
  home.packages = with pkgs; [
    anyrun
    rofi-wayland

    waybar
    wlogout
    swww

    hyprshot
    hyprlock
    satty

    kitty
    firefox
    gui-for-singbox
  ];
}
