with builtins;
with (import ../../utils/fetch.nix);
{
  inputs =  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    lazy-nvim = fetchGithub "folke/lazy.nvim/stable";
    mpv-modernx = fetchGithub "cyl0/ModernX";
    nvim = fetchFlake "lingshinx/nvim-config/v0.3";
  };

  outputs = { nvim, ...} @ inputs: {
    modules = [
      ./base.nix
    ];
  };
}
