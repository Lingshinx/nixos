{
  imports = [../../system ./hardware (import ../template.nix ./home)];

  system.stateVersion = "26.05";
  features = {
    kde.enable = true;
  };
  programs.steam.enable = true;
  programs.dux-shell.enable = true;
  programs.dux-shell.systemd.enable = false;
}
