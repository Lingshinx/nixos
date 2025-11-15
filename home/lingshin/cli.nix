{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
    bat
    fzf
    fd
    ripgrep
    choose

    tldr
    fastfetch

    # for fish
    zoxide
    starship

    socat
  ];
}
