{ pkgs ? import ./nix/pkgs.nix {} }:

pkgs.vimUtils.buildVimPluginFrom2Nix {
  pname = "aniseed";
  version = "v3.22.1";
  src = pkgs.fetchFromGitHub {
    owner = "Olical";
    repo = "aniseed";
    rev = "f764c5cf633a89ea71a41055413e3a36acb43541";
    sha256 = "1za93194wdhw29fz6z4lj8xh8cq38gq9sdavc2syyc50amfqpxh3";
  };
  meta.homepage = "https://github.com/Olical/aniseed";
}
