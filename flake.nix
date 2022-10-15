# Experimental flake interface to Nixpkgs.
# See https://github.com/NixOS/rfcs/pull/49 for details.
{
  description = "A collection of custom packages for the Nix package manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let out = system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          libcurl-example = import ./termdbms pkgs;
        };
      };
    in flake-utils.lib.eachDefaultSystem out;
}
