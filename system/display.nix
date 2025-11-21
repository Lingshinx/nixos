{pkgs, inputs, ...}: {
  imports = [inputs.silentSDDM.nixosModules.default];

  qt.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "silent";
    silent = {
      theme = ../dotfiles/sddm-silent-lingshin.conf;
      extraBackgrounds = [../assets/dust.jpg];
    };
  };

  programs.niri.enable = true;
  environment.systemPackages = [pkgs.xwayland-satellite];
}
