let
  fetchGithub = repo: {
    url = "github:" + repo;
    flake = false;
  };

  fetchFlake = repo: {
    url = "github:" + repo;
    inputs.nixpkgs.follows = "nixpkgs";
  };

  sources = {
    lazy-nvim = fetchGithub "folke/lazy.nvim/stable";
    mpv-modernx = fetchGithub "cyl0/ModernX";
    nvim = fetchFlake "lingshinx/nvim-config";
  };
in
  with builtins; {
    inputs =
      sources
      // {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
      };

    outputs = inputs: {
      modules = [./base.nix];
    };
  }
