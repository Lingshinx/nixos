with (import ../../utils/listFs.nix); {
  imports =
    (listAllFiles ../../system)
    ++ [
      ./hardware
      {
        system.stateVersion = "26.05";
        features = {
          kde.enable = true;
          waydroid.enable = true;
        };
        programs.steam.enable = true;
        programs.dux-shell.enable = true;
      }
    ];
}
