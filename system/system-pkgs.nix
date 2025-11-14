{pkgs, ...}: {
  programs.nano.enable = false;
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    gcc
    neovim
    git
    fish
  ];
}
