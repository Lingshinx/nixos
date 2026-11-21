{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.qt6ct
    whitesur-kde
  ];

  gtk = {
    enable = true;
    gtk2.force = true;
    gtk4.theme = config.gtk.theme;
    theme = {
      name = "WhiteSur";
      package = pkgs.whitesur-gtk-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme.override {
        alternativeIcons = true;
      };
    };
  };
}
