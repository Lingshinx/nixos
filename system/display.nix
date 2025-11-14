{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.niri.enable = true;
  environment.systemPackages = [pkgs.xwayland-satellite];
}
