{
  config,
  lib,
  pkgs,
  utils,
  ...
}: {
  imports =
    utils.listAllFiles ../../system
    ++ [
      ./hardware.nix
      ../../home/lingshin
    ];

  system.copySystemConfiguration = true;
  system.stateVersion = "25.11"; # Did you read the comment?
}
