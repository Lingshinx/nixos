with builtins;
with (import ../../utils/fetch.nix);
{
  inputs =  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    mpv-modernx = fetchGithub "cyl0/ModernX";
    nvim = fetchFlake "lingshinx/nvim-config/flake";
  };

  outputs = { nvim, ...} @ inputs: {
    modules = [
      ./base.nix
    ];
  };
}
