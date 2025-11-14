{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings = {
      sandbox = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.org/"
      ];
    };
  };
}
