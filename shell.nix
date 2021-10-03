{ pkgs ? import ./pkgs.nix { } }:

let
  fnlfmt = pkgs.callPackage ./fnlfmt.nix {};
in
  pkgs.mkShell {
    buildInputs = [ pkgs.fennel fnlfmt ];
  }
