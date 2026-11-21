{hostname, ...}: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
    hostName = hostname;
  };

  services.tailscale.enable = true;
}
