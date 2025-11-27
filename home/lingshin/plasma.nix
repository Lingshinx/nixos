{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.lingshin.inputs.plasma-manager.homeModules.plasma-manager];

  home.packages = with pkgs;
  with kdePackages; [
    whitesur-kde
    plasma-keyboard
    # karousel
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "com.github.vinceliuice.WhiteSur-alt";
      iconTheme = "WhiteSur";
      theme = "WhiteSur-alt";
      colorScheme = "WhiteSurAlt";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 20;
      };
    };

    panels = [
      {
        location = "top";
        height = 26;
        lengthMode = "fill";
        floating = true;
        widgets = [
          "org.kde.plasma.windowlist"
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          {digitalClock.settings.Appearance.showDate = true;}
        ];
      }

      {
        location = "bottom";
        height = 38;
        floating = true;
        lengthMode = "fit";
        hiding = "autohide";
        widgets = [
          {kickoff = {icon = "distributor-logo-nixos";};}
          "org.kde.plasma.icontasks"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
  };
}
