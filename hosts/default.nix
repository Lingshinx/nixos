let
  inherit (import ../utils/attr.nix) merge;
  getUser = user: import ../home/${user}/flake.in.nix;
in {inputs, outputs, users}: {
  inputs = merge (map (user: (getUser user).inputs) users) // inputs;
  outputs = inputs:
    [./common.nix (outputs inputs).nixosModules.default] ++
    (map (user: ((getUser user).outputs inputs).nixosModules.default) users);
}
