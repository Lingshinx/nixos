{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop shell
    anyrun
    rofi
    waybar
    wlogout
    swww
    hyprlock

    # utils
    hyprshot
    satty

    # application
    kitty
    swayimg
    firefox
    localsend
    throne

    neovide
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Light";
      package = pkgs.tokyonight-gtk-theme;
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

  programs = {
    mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [modernx thumbfast];
    };
  };
}
