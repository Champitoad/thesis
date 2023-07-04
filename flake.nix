{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.packages.x86_64-linux;
    tectonic = pkgs.tectonic;
  in {
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = [ tectonic ];
    };
  };
}
