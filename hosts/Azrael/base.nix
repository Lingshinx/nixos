with (import ../utils/listFs.nix);
{
  imports = builtins.concatLists [
    (listAllFiles ../../system)
    [
      ./hardware
      ./plasma.nix
      ./waydroid.nix
      ./steam.nix
      ./dux.nix
    ]
    {
      system.stateVersion = "26.05";
    }
  ]
}
