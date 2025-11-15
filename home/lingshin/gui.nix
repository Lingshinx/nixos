{pkgs, ...}: {
  home.packages = with pkgs; [
    anyrun
    rofi-wayland
    waybar
    wlogout
    kitty
    firefox
    gui-for-singbox

    hyprshot
    hyprlock
    satty
  ];
}
