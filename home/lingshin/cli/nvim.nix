{pkgs, ...}: {
  programs.neovim.enable = true;
  programs.neovim = {
    plugins = [pkgs.vimPlugins.lazy-nvim];
    extraPackages = with pkgs; [
      stylua
      lua-language-server

      github-cli

      alejandra
      nixd

      nodejs
    ];
  };
}
