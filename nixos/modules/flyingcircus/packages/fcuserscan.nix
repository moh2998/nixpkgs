{ pkgs, stdenv, fetchFromGitHub, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  name = "fc-userscan-${version}";
  version = "0.4.2";

  src = fetchFromGitHub {
    owner = "flyingcircusio";
    repo = "userscan";
    rev = version;
    sha256 = "003ilmygqd675h3kkwpa236xkkzavx7ivjjaz1478gn25gxv8004";
  };

  cargoDepsSha256 = "15wwqw156pk93zdx3xvgyv1bjbvzwfyz7vypk2pzcgx7shzfk1vj";
  nativeBuildInputs = with pkgs; [ git docutils ];
  propagatedBuildInputs = with pkgs; [ lzo ];
  doCheck = true;

  postBuild = ''
    substituteAll $src/userscan.1.rst $TMP/userscan.1.rst
    rst2man.py $TMP/userscan.1.rst > $TMP/userscan.1
  '';
  postInstall = ''
    install -D $TMP/userscan.1 $out/share/man/man1/fc-userscan.1
  '';

  meta = with stdenv.lib; {
    description = "Scan and register Nix store references from arbitrary files";
    homepage = https://github.com/flyingcircusio/userscan;
    license = with licenses; [ bsd3 ];
    platforms = platforms.all;
  };
}
