{inputs, ...}: {
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
  ];

  programs.dank-material-shell.enable = true;
}
