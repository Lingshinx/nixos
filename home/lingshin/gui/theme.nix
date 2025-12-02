{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "kde";
    style = {
      name = "WhiteSur-alt";
      package = pkgs.whitesur-kde;
    };
  };

  gtk = {
    enable = true;
    gtk2.force = true;
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
