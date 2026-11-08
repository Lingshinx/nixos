{pkgs, config, lib, ...}: {
  options.features.waydroid.enable = lib.mkEnableOption "Whether to enable waydroid";
  config = lib.mkIf config.features.waydroid.enable {
    virtualisation.waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };

    environment.systemPackages = [pkgs.waydroid-helper];

    systemd = {
      packages = [pkgs.waydroid-helper];
      services.waydroid-mount.wantedBy = ["multi-user.target"];
    };
  };
}
