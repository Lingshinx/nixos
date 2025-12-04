{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NixOS";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd"];
    };

    "/home" = {
      device = "/dev/disk/by-label/NixOS";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd"];
    };

    "/nix" = {
      device = "/dev/disk/by-label/NixOS";
      fsType = "btrfs";
      options = ["subvol=@nix" "noatime" "compress=zstd"];
    };

    "/boot" = {
      device = "/dev/disk/by-label/EFI";
      fsType = "vfat";
      options = ["umask=0077"];
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];
}
