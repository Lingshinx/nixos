{
  outputs = {
    self,
    Azrael,
    ...
  }: {
    nixosConfigurations.Azrael = Azrael;
  };

  inputs = {
    Azrael.url = "path:./hosts/Azrael";
  };
}
