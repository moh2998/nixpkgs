{ pkgs, nixpkgs, version, versionSuffix }:

with pkgs;
pkgs.releaseTools.channel {
  name = "nixos-channel";
  src = nixpkgs;
  inherit version versionSuffix;
  constituents = [ nixpkgs ];
  buildInputs = [ pkgs.nix ];

  patchPhase = ''
    echo "${version}" > .version
    echo "${versionSuffix}" > .version-suffix
  '';
  meta = {
    description = "NixOS - Flying Circus flavour";
    homepage = "https://flyingcircus.io/doc/";
    license = [ licenses.bsd3 ];
    maintainer = with maintainers; [ ckauhaus theuni ];
  };
}
