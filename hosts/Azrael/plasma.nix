{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    ark
    (lib.getBin qttools)
    elisa
    gwenview
    okular
    kate
    baloo-widgets
    ffmpegthumbs
    krdp
    xwaylandvideobridge
  ];
}
