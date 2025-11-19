{pkgs, inputs, ...}: let
  silent-sddm = inputs.silentSDDM.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    theme = ../dotfiles/sddm-silent-lingshin.conf;
    extraBackgrounds = [../assets/dust.jpg];
  };
in {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = silent-sddm.pname;
    extraPackages = silent-sddm.propagatedBuildInputs;
  };

  programs.niri.enable = true;
  environment.systemPackages = [pkgs.xwayland-satellite silent-sddm];
  qt.enable = true;
}
