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
    lazy-nvim = fetchGithub "folke/lazy.nvim?rev=stable";
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

    outputs = inputs:
      listToAttrs (map (name: {
        inherit name;
        value = inputs."${name}";
      }) (attrNames sources))
      // {
        modules = [
          ./default.nix
        ];
      };
  }
