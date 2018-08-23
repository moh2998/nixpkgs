{ lib, stdenv, glibc, fetchurl, zlib, readline, libossp_uuid, openssl, makeWrapper }:

let

  common = { version, sha256, psqlSchema } @ args:
   let atLeast = lib.versionAtLeast version; in stdenv.mkDerivation (rec {
    name = "postgresql-${version}";

    src = fetchurl {
      url = "mirror://postgresql/source/v${version}/${name}.tar.bz2";
      inherit sha256;
    };

    outputs = [ "out" "doc" ];

    buildInputs =
      [ zlib readline openssl makeWrapper ]
      ++ lib.optionals (!stdenv.isDarwin) [ libossp_uuid ];

    enableParallelBuilding = true;

    makeFlags = [ "world" ];

    configureFlags = [
      "--with-openssl"
      "--sysconfdir=/etc"
    ]
      ++ lib.optional (stdenv.isDarwin)  "--with-uuid=e2fs"
      ++ lib.optional (!stdenv.isDarwin) "--with-ossp-uuid";

    patches =
      [ (if atLeast "9.4" then ./disable-resolve_symlinks-94.patch else ./disable-resolve_symlinks.patch)
        (if atLeast "9.6" then ./less-is-more-96.patch             else ./less-is-more.patch)
        (if atLeast "9.6" then ./hardcode-pgxs-path-96.patch       else ./hardcode-pgxs-path.patch)
        ./specify_pkglibdir_at_runtime.patch
      ];

    installTargets = [ "install-world" ];

    LC_ALL = "C";

    postConfigure =
      let path = if atLeast "9.6" then "src/common/config_info.c" else "src/bin/pg_config/pg_config.c"; in
        ''
          # Hardcode the path to pgxs so pg_config returns the path in $out
          substituteInPlace "${path}" --replace HARDCODED_PGXS_PATH $out/lib
        '';

    postInstall =
      ''
        # Prevent a retained dependency on gcc-wrapper.
        substituteInPlace "$out/lib/pgxs/src/Makefile.global" --replace ${stdenv.cc}/bin/ld ld
      '';

    postFixup =
      ''
        # initdb needs access to "locale" command from glibc.
        wrapProgram $out/bin/initdb --prefix PATH ":" ${glibc}/bin
      '';

    disallowedReferences = [ stdenv.cc ];

    passthru = {
      inherit readline psqlSchema;
    };

    meta = with lib; {
      homepage = http://www.postgresql.org/;
      description = "A powerful, open source object-relational database system";
      license = licenses.postgresql;
      maintainers = [ maintainers.ocharles ];
      platforms = platforms.unix;
      hydraPlatforms = platforms.linux;
    };
  });

in {

  postgresql90 = common {
    version = "9.0.23";
    psqlSchema = "9.0";
    sha256 = "1pnpni95r0ry112z6ycrqk5m6iw0vd4npg789czrl4qlr0cvxg1x";
  };

  postgresql91 = common {
    version = "9.1.24";
    psqlSchema = "9.1";
    sha256 = "de0d84e9f32af145fcd66d8d324f6ef1a0b17944ea344b7bbe9d99fff68ae5d3";
  };

  postgresql92 = common {
    version = "9.2.24";
    psqlSchema = "9.2";
    sha256 = "a754c02f7051c2f21e52f8669a421b50485afcde9a581674d6106326b189d126";
  };

  postgresql93 = common {
    version = "9.3.24";
    psqlSchema = "9.3";
    sha256 = "8214a73a3b2135226bdc1394c9efdcb80f79e504ec700cf9b23d0b6bc2b60da9";
  };

  postgresql94 = common {
    version = "9.4.19";
    psqlSchema = "9.4";
    sha256 = "03776b036b2a05371083558e10c21cc4b90bde9eb3aff60299c4ce7c084c168b";
  };

  postgresql95 = common {
    version = "9.5.14";
    psqlSchema = "9.5";
    sha256 = "3e2cd5ea0117431f72c9917c1bbad578ea68732cb284d1691f37356ca0301a4d";
  };

  postgresql96 = common {
    version = "9.6.10";
    psqlSchema = "9.6";
    sha256 = "8615acc56646401f0ede97a767dfd27ce07a8ae9c952afdb57163b7234fe8426";
  };

  postgresql100 = common {
    version = "10.5";
    psqlSchema = "10.0";
    sha256 = "6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011";
  };

}
