{hostName, ...}: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
    inherit hostName;
  };

  services.tailscale.enable = true;
}
