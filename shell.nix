{ pkgs ? import ./nix/pkgs.nix { } }:

let
  fnlfmt = pkgs.callPackage ./nix/fnlfmt.nix {};
in
  pkgs.mkShell {
    buildInputs = [ pkgs.fennel fnlfmt ];
  }
