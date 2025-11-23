{pkgs, ...}: {
  services.desktopManager.gnome.enable = true;

  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];
}
