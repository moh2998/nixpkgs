{ pkgs, lib, stdenv, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  name = "sensu-syntax-${version}";
  version = "0.1.0";

  src = lib.cleanSource ./.;
  cargoDepsSha256 = "0cgysvy7ydb3r5kj9imfn233g74hqlp2adm2vj5ks2441ijbbfwb";
  doCheck = true;

  meta = with stdenv.lib; {
    description = "Sensu client config self-check";
    license = with licenses; [ bsd3 ];
    platforms = platforms.all;
  };
}
