{
  inputs = {
    lazy-nvim = {
      flake = true;
      url = "github:folke/lazy.nvim/stable";
    };
    mpv-modernx = {
      flake = true;
      url = "github:cyl0/ModernX";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:lingshinx/nvim-config";
    };
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}