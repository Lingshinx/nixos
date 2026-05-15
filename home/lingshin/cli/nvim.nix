{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      stylua
      lua-language-server

      tree-sitter

      github-cli

      alejandra
      nixd
    ];
  };
}
