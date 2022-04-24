let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};

  aniseed = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "aniseed";
    version = "v3.28.0";
    src = pkgs.fetchFromGitHub {
      owner = "Olical";
      repo = "aniseed";
      rev = "0c82834c134c77baae6c91af7e98a53a006f3c7b";
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
