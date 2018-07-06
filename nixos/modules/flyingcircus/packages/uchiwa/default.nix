{ lib
, buildBowerComponents
, callPackage
, fetchFromGitHub
, goPackages
, stdenv
}:

let
  version = "0.14.2";
  src = fetchFromGitHub {
    owner = "sensu";
    repo = "uchiwa";
    rev = "${version}";
    sha256 = "0jzx8a0yz1s4shgb41s7d2gyjpzrasp3rj8zi4npqvr321s6xiza";
  };

  uchiwa_go_package = goPackages.buildGoPackage {
    inherit version src;

    name = "uchiwa-${version}";
    goPackagePath = "github.com/sensu/uchiwa";

    buildInputs = [
        goPackages.context
        goPackages.mapstructure

        (goPackages.buildGoPackage rec {
          name = "dgrijalva-jwt-go-${rev}";
          goPackagePath = "github.com/dgrijalva/jwt-go";
          rev = "v2.2.0-15-g61124b6";

          src = fetchFromGitHub {
            inherit rev;
            owner = "dgrijalva";
            repo = "jwt-go";
            sha256 = "1pjianfr96rxa5b9sc9659gnay3kqwhcmjw26z77gznfjxajigqd";
          };
        })

       (goPackages.buildGoPackage rec {
         name = "palourde-mergo-${rev}";
         goPackagePath = "github.com/palourde/mergo";
         rev = "v0.2.0-10-gd931ffd";
         src = fetchFromGitHub {
           inherit rev;
           owner = "palourde";
           repo = "mergo";
           sha256 = "0kdwx97fqxhk3ia3bf6z0q3ayb7mmdh7d7i8rihzlyxi28wpj072";
         };
       })

    ];
  };

  uchiwaWeb = buildBowerComponents {
    inherit src;
    name = "uchiwa-web";
    generated = ./uchiwa-web-deps.nix;
  };

in

stdenv.mkDerivation {
  name="uchiwa-${version}";
  inherit src;

  dontBuild = true;
  doCheck = false;
  installPhase = ''
    mkdir $out
    ln -s ${uchiwa_go_package.bin}/bin $out/bin
    ln -s ${uchiwa_go_package}/share $out/share
    cp -a public $out/public
    ln -s ${uchiwaWeb}/bower_components $out/public/bower_components
  '';
  dontStrip = true;
  dontPatchELF = true;

  meta = with lib; {
    description = "Uchiwa is a simple dashboard for the Sensu monitoring framework.";
    homepage    = "https://uchiwa.io/";
    license     = licenses.mit;
    platforms   = platforms.unix;
  };

}
