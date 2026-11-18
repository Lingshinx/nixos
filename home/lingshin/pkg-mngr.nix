{config, ...}: {
  nix.registry.nixos.to = {
    type = "path";
    path = "${config.xdg.configHome}/nixos";
  };
}
