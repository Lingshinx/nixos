{
  merge = builtins.foldl' (a: b: a // b) {};
}
