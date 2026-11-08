{pkgs, lib, config, ...}: let
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
  options = {
    features.kde = {
      enable = lib.mkEnableOption "Whether to enable KDE plasma 6";
      my-plasma-session = lib.mkEnableOption
        "Whether to generate a desktop session if fail to start plasma";
    };
  };
  config = lib.mkIf config.features.kde.enable {
    services.displayManager.sessionPackages = lib.mkIf config.features.kde.my-plasma-session [
      myPlasma
    ];

    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = false;
    };

    environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
    environment.plasma6 = {
      excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        elisa
        baloo-widgets
        krdp
      ];
    };
  };
}
