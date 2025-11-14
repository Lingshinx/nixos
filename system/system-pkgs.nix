{pkgs, ...}: {
  programs.nano.enable = false;
  environment.systemPackages = with pkgs; [
    gcc
    neovim
    git
    fish
  ];
}
