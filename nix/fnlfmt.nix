{ lib, stdenv, fetchFromSourcehut, fennel, lua }:

stdenv.mkDerivation rec {
  pname = "fnlfmt";
  version = "main";

  src = fetchFromSourcehut {
    owner = "~technomancy";
    repo = pname;
    rev = version;
    sha256 = "1bkcyfjpbnfrjax5l5bn55s3p79lm297lyc4a2qsj207yv93kz3y";
  };

  nativeBuildInputs = [ fennel ];

  buildInputs = [ lua ];

  buildPhase = ''
    runHook preBuild

    echo "#!${lua}/bin/lua" > fnlfmt
    ${fennel}/bin/fennel --require-as-include --compile cli.fnl >> fnlfmt
    chmod +x fnlfmt

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -D ./fnlfmt $out/bin/fnlfmt
    runHook postInstall
  '';

  meta = with lib; {
    description = "Formatter for Fennel";
    homepage = "https://git.sr.ht/~technomancy/fnlfmt";
    license = licenses.lgpl3Plus;
    platforms = lua.meta.platforms;
    maintainers = [ maintainers.gpanders ];
  };
}
