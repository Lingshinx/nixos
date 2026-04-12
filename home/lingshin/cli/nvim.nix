{pkgs, ...}: {
  programs.neovim.enable = true;
  programs.neovim = {
    plugins = [pkgs.vimPlugins.lazy-nvim];
    extraPackages = with pkgs; [
      stylua
      lua-language-server

      tree-sitter

      github-cli

      alejandra
      nixd

      nodejs
    ];
  };
}
