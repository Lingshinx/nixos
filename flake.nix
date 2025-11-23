{
  inputs = {
    Azrael = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "path:./hosts/Azrael";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs: (import ./flake.in.nix).outputs inputs;
}
