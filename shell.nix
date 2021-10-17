let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  fnlfmt = pkgs.callPackage ./nix/fnlfmt.nix { };
in
pkgs.mkShell {
  buildInputs =
    [
      pkgs.niv
      pkgs.nixpkgs-fmt
      pkgs.fennel
      fnlfmt
    ];
}
