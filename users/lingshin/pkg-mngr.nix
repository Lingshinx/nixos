{config, ...}: {
  nix.registry.nixos.to = {
    type = "path";
    path = "${config.xdg.configHome}/nixos";
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
