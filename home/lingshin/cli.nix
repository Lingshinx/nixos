{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # base utils
    eza # ls
    bat # cat
    fd # find
    ripgrep # grep
    choose # cut
    gomi # rm
    dust # du

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

    home-manager
  ];

  imports = [inputs.lingshin.inputs.nvim.homeModules.default];

  programs.neovim = {
    enable = true;
    lingshin-config = {
      enable = true;
      languages = ["nix" "fish" "lua"];
    };

    extraPackages = with pkgs; [
      stylua
      luajitPackages.lua-lsp

      fish-lsp

      alejandra
      nixd
    ];
  };
}
