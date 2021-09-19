{ pkgs ? import ./pkgs.nix { } }:

pkgs.stdenv.mkDerivation {
  name = "build-neovim-files";
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup
    mkdir $out
    fennel -c ${./config.fnl} > $out/config.lua
    fennel -c ${./lsp.fnl} > $out/lsp.lua
  '';
  src = [];
  buildInputs = [ pkgs.fennel ];
}
