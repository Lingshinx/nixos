{pkgs, ...}: {
  xdg.portal = rec {
    enable = true;
    xdgOpenUsePortal = true;
    config.niri.default = "gtk";
    configPackages = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome];
    extraPortals = configPackages;
  };
}
