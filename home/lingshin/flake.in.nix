with builtins;
with (import ../../utils/fetch.nix);
{
  inputs =  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    lazy-nvim = fetchGithub "folke/lazy.nvim/stable";
    mpv-modernx = fetchGithub "cyl0/ModernX";
    nvim = fetchFlake "lingshinx/nvim-config";
  };

  outputs = inputs: {
    modules = [./base.nix];
  };
}
