{ pkgs, stdenv, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  name = "logcheck-helper";
  src = ./logcheck-helper;
  cargoDepsSha256 = "0sahsqsaa5f5k9jcjf4hr7lcsfj72mjqj4yd5nll24j2hn245nj9";
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Derive a correct regular expression for logcheck ignore patterns";
    license = with licenses; [ bsd3 ];
    platforms = platforms.all;
  };
}

