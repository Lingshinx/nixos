{
  users = ["lingshin"];
  inputs = {};
  outputs = {...}: { nixosModules.default = ./base.nix; };
}
