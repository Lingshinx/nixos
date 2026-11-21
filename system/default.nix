{myLib, ...}: {
  imports = myLib.fs.list.exceptDefault ./.;
}
