{
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  plymouth-theme-inputs = inputs.plymouth-theme-lagtrain.packages.${system}.default;
in {
  boot = {
    plymouth = {
      enable = true;
      theme = "lagtrain";
      themePackages = [plymouth-theme-inputs];
    };

    initrd.verbose = false;

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quite"
      "splash"
      "plymouth.use-simpledrm"
    ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
