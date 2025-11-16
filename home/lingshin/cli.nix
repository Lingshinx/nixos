{pkgs, ...}: {
  home.packages = with pkgs; [
    # base utils
    eza     # ls
    bat     # cat
    fd      # find
    ripgrep # grep
    choose  # cut

    just # make
    tldr # man

    jq
    fastfetch

    # tui
    lazygit

    # for fish
    fzf
    zoxide
    starship

    socat
  ];
}
