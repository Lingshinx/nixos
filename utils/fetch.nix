let
  fetchGithubWith = attr: repo:
    {
      url = "github:" + repo;
    }
    // attr;
in {
  fetchGithub = fetchGithubWith {};
  fetchFlake = fetchGithubWith {
    inputs.nixpkgs.follows = "nixpkgs";
  };

  fetchHomeManager = fetchGithubWith {
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };
}
