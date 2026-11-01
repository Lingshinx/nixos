{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.silentSDDM.nixosModules.default];

  qt.enable = true;
  services.displayManager = {
    defaultSession = "niri";
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "silent";
      settings.General.DisplayServer = "wayland";
      silent = {
        theme = ../assets/sddm-silent-lingshin.conf;
        extraBackgrounds = [../assets/dust.jpg];
      };
    };
  };
  programs.niri.enable = true;
  environment.systemPackages = [pkgs.xwayland-satellite];
}
