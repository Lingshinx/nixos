{
  config,
  pkgs,
  ...
}: {
  home.username = "lingshin";
  home.homeDirectory = "/home/lingshin";

  home.packages = with pkgs; [
    fastfetch
    eza
    fzf
    socat
    waybar
    wlogout
    kitty
    firefox
    gui-for-singbox
  ];

  programs = {
    git = {
      enable = true;
      userName = "lingshin";
      userEmail = "yokaringx@outlook.com";
    };

    starship.enable = true;
    home-manager.enable = true;
  };

  home.stateVersion = "25.05";
}
