{ stdenv, fetchFromGitHub, postgresql }:

let
  version = "1.2.1";
in
stdenv.mkDerivation {
  name = "rum-${version}";

  src = fetchFromGitHub {
    rev = "${version}";
    owner = "postgrespro";
    repo = "rum";
    sha256 = "1k67gg1mlw7299yf67xm7d4rsq9xrkqql1grkgpyyc23dp1dkad4";
  };

  buildInputs = [ postgresql ];

  makeFlags = [
    "USE_PGXS=1"
  ];

   installPhase =
   ''
     mkdir -p $out/{bin,lib}
     cp ./rum.so $out/lib
     mkdir -p $out/share/extension
     cp ./rum.control ./rum--1.0.sql ./rum--1.2.sql $out/share/extension
   '';
 }
