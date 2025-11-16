{pkgs, ...}: {
  programs = {
    nano.enable = false;
    fish.enable = true;
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gcc
    neovim
    git
    fish
  ];
}
