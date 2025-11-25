{
  pkgs,
  lib,
  ...
}: let
  myPlasma =
    pkgs.writeTextFile {
      name = "my-plasma-session.desktop";
      destination = "/share/wayland-sessions/plasma-lingshin.desktop";
      text = ''
        [Desktop Entry]
        Name=Plasma (Lingshin)
        Exec=dbus-run-session startplasma-wayland
        DesktopNames=KDE
      '';
    }
    // {
      providedSessions = ["plasma-lingshin"];
    };
in {
  services.xserver.displayManager.sessionPackages = [
    myPlasma
  ];

  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = false;
  };

  environment.plasma6 = {
    excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      ark
      (lib.getBin qttools)
      elisa
      okular
      baloo-widgets
      krdp
    ];
  };
}
