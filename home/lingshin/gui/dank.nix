{inputs, ...}: {
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
  ];

  programs.dankMaterialShell = {
    enable = true;
  };
}
