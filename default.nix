let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};

  aniseed = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "aniseed";
    version = "v3.29.0";
    src = pkgs.fetchFromGitHub {
      owner = "Olical";
      repo = "aniseed";
      rev = "bfaefa11c9e6b36b17a7fe11f8f005198411c3e5";
      sha256 = "sha256-bYwso4JLsOJwPU6WvkEvNCVJeedpSg1TmhY8aQhYEYc";
    };
    meta.homepage = "https://github.com/Olical/aniseed";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "init.vim";
    phases = ["installPhase" "fixupPhase"];
    installPhase = ''
      mkdir $out
      cat << EOF > $out/init.vim
      set runtimepath+=${aniseed}
      let g:aniseed#env = v:true
      EOF
    '';
  }
