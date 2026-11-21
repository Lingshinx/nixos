let
  path = self: part: {
    outPath = self.outPath + "/${part}";
    __functor = path;
  };
  mkPath = root: {
    outPath = root;
    __functor = path;
  };
in rec {
  outPath = ./.;
  __functor = path;
  users = mkPath ./users;
  assets = mkPath ./assets;
  avatars = assets "avatars";
}
