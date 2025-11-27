{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  gtk = {
    enable = true;
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
