{ pkgs, lib, stdenv, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  name = "sensu-syntax-${version}";
  version = "0.1.0";

  src = lib.cleanSource ./.;
  cargoDepsSha256 = "1yqfyj0fa47r56gxcaqizwk7psmbxl663llah76irc4rn7cdgc74";
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Sensu client config self-check";
    license = with licenses; [ bsd3 ];
    platforms = platforms.all;
  };
}
