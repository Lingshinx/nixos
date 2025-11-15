{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
    bat
    fzf
    fd
    ripgrep
    choose

    tldr

    # for fish
    zoxide
    starship

    socat
  ];
}
