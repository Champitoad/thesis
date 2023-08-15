{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};

      pkgs_biber = import
        (builtins.fetchGit {
          # Descriptive name to make the store path easier to identify                
          name = "nixpkgs-biber-2.14";
          url = "https://github.com/NixOS/nixpkgs/";
          ref = "refs/heads/nixpkgs-unstable";
          rev = "3913f6a514fa3eb29e34af744cc97d0b0f93c35c";
        })
        { inherit system; };

      tectonic = pkgs.tectonic;
      biber = pkgs_biber.biber;
      pygments = pkgs.python311Packages.pygments;

      tikzit = pkgs.tikzit;
      texlive = pkgs.texlive.combined.scheme-full;

      buildPackages = [ tectonic biber pygments ];
      devPackages = [ tikzit texlive ];
    in
    {
      devShell.${system} = pkgs.mkShell {
        packages = buildPackages ++ devPackages;
      };
    };
}
