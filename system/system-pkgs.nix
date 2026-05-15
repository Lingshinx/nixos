{
  pkgs,
  lib,
  ...
}: {
  programs = {
    nano.enable = false;
    fish.enable = true;
  };
  environment.shellAliases = lib.mkForce {};
  environment.systemPackages = with pkgs; [
    gcc
    neovim
    git
    fish
    inotify-tools
    psmisc
    lsof
  ];
}
