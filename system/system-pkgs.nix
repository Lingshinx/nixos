{
  pkgs,
  lib,
  ...
}: {
  programs = {
    nano.enable = false;
    fish.enable = true;
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  environment.shellAliases = lib.mkForce {};
  environment.systemPackages = with pkgs; [
    gcc
    neovim
    git
    fish
  ];
}
