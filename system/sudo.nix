{...}: {
  users.groups.sudo = {};
  security.sudo.extraConfig = "%sudo	ALL=(ALL:ALL) ALL";
}
