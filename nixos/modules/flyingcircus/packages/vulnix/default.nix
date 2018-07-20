{ pkgs, fetchurl, fetchFromGitHub }:

let
  pname = "vulnix";
  version = "1.7";
  python = import ./requirements.nix { inherit pkgs; };
  src = fetchFromGitHub {
    owner = "flyingcircusio";
    repo = "vulnix";
    rev = version;
    sha256 = "1vwnp7szff7a0rjqkc9n4jkb884fpmgm7ix7527c635cq0i37ycb";
  };

in
python.mkDerivation {
  inherit version src;
  name = "${pname}-${version}";

  buildInputs = [ pkgs.ronn ];

  propagatedBuildInputs = [
    pkgs.nix
    python.packages."click"
    python.packages."colorama"
    python.packages."lxml"
    python.packages."PyYAML"
    python.packages."toml"
    python.packages."requests"
    python.packages."ZODB"
  ];

  postBuild = ''
    make -C doc
  '';

  doCheck = false;

  postInstall = ''
    install -D -t $out/share/man/man1 doc/vulnix.1
    install -D -t $out/share/man/man5 doc/vulnix-whitelist.5
    install -D -t $out/share/doc/vulnix README.rst CHANGES.rst
    gzip $out/share/doc/vulnix/*.rst
  '';

  meta = {
    description = "NixOS vulnerability scanner";
    homepage = https://github.com/flyingcircusio/vulnix;
    license = pkgs.lib.licenses.bsd2;
  };
}
