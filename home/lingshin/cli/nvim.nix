{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nvim.homeModules.default];
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
