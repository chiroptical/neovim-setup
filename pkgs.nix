import (builtins.fetchGit {
  # Descriptive name to make the store path easier to identify
  name = "nixos-unstable";
  url = "https://github.com/nixos/nixpkgs";
  # Commit hash for nixos-unstable as of 2021-07-22
  # `git ls-remote https://github.com/nixos/nixpkgs nixos-unstable`
  ref = "refs/heads/nixos-unstable";
  rev = "79c444b5bdeaba142d128afddee14c89ecf2a968";
})
