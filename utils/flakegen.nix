with builtins;
file: toFile "flake.nix" ''
  {
    inputs = ${(import ./pretty.nix).show' "  " (import file).inputs};
    outputs = inputs: (import ./flake.in.nix).outputs inputs;
  }''
