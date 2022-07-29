let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  my-fnlfmt = pkgs.callPackage ./nix/fnlfmt.nix {};
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      niv
      fennel
      my-fnlfmt
      alejandra
    ];
  }
