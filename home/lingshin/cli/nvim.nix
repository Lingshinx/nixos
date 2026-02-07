{pkgs, ...}: {
  programs.neovim.enable = true;
  programs.neovim = {
    plugins = [pkgs.vimPlugins.lazy-nvim];
    extraPackages = with pkgs; [
      stylua
      luajitPackages.lua-lsp

      github-cli

      fish-lsp

      alejandra
      nixd

      nodejs
    ];
  };
}
