{pkgs, ...}: {
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  # Wayland requires kernel mode setting (KMS) to be enabled (Highly Recommended):
  hardware.nvidia.modesetting.enable = true;
}
