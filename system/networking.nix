{...}: {
  networking = {
    hostName = "Azrael";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [10721];
  };
}
