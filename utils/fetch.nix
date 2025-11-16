{
  fetchGithub = repo: {
    url = "github:" + repo;
    flake = false;
  };

  fetchFlake = repo: {
    url = "github:" + repo;
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
