{pkgs, ...}: {
  imports = [./nvim.nix ./gpg.nix];

  home.packages = with pkgs; [
    # base utils
    eza # ls
    bat # cat
    fd # find
    ripgrep # grep
    choose # cut
    gomi # rm
    dust # du
    delta # diff

    just # make
    tldr # man

    jujutsu # git

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

  programs = {
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "lingshin";
          email = "yokaringx@outlook.com";
        };
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
