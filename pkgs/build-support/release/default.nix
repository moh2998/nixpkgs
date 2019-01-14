{pkgs}:

with pkgs;

rec {

  sourceTarball = args: import ./source-tarball.nix (
    { inherit stdenv autoconf automake libtool;
    } // args);

  makeSourceTarball = sourceTarball; # compatibility

  binaryTarball = args: import ./binary-tarball.nix (
    { inherit stdenv;
    } // args);

  antBuild = args: import ./ant-build.nix (
    { inherit pkgs;
    } // args);

  mvnBuild = args: import ./maven-build.nix (
    { inherit stdenv;
    } // args);

  nixBuild = args: import ./nix-build.nix (
    { inherit stdenv;
    } // args);

  coverageAnalysis = args: nixBuild (
    { inherit lcov enableGCOVInstrumentation makeGCOVReport;
      doCoverageAnalysis = true;
    } // args);

  clangAnalysis = args: nixBuild (
    { inherit clang-analyzer;
      doClangAnalysis = true;
    } // args);

  coverityAnalysis = args: nixBuild (
    { inherit cov-build xz;
      doCoverityAnalysis = true;
    } // args);

  gcovReport = args: import ./gcov-report.nix (
    { inherit runCommand lcov rsync;
    } // args);

  rpmBuild = args: import ./rpm-build.nix (
    { inherit vmTools;
    } // args);

  debBuild = args: import ./debian-build.nix (
    { inherit stdenv vmTools checkinstall;
    } // args);

  aggregate =
    { name, constituents, meta ? { } }:
    pkgs.runCommand name
      { inherit constituents meta;
        preferLocalBuild = true;
        _hydraAggregate = true;
      }
      ''
        mkdir -p $out/nix-support
        touch $out/nix-support/hydra-build-products
        echo $constituents > $out/nix-support/hydra-aggregate-constituents

        # Propagate build failures.
        for i in $constituents; do
          if [ -e $i/nix-support/failed ]; then
            touch $out/nix-support/failed
          fi
        done
      '';

  # FCIO: channel creation backported from 18.09
  channel =
    { name, src, constituents ? [], meta ? {}, isNixOS ? true, ... }@args:
    stdenv.mkDerivation ({
      preferLocalBuild = true;
      _hydraAggregate = true;

      phases = [ "unpackPhase" "patchPhase" "installPhase" ];

      patchPhase = stdenv.lib.optionalString isNixOS ''
        touch .update-on-nixos-rebuild
      '';

      installPhase = ''
        mkdir -p $out/{tarballs,nix-support}

        tar cJf "$out/tarballs/nixexprs.tar.xz" \
          --owner=0 --group=0 --mtime="1970-01-01 00:00:00 UTC" \
          --transform='s!^\.!${name}!' .

        echo "channel - $out/tarballs/nixexprs.tar.xz" > "$out/nix-support/hydra-build-products"
        echo $constituents > "$out/nix-support/hydra-aggregate-constituents"

        # Propagate build failures.
        for i in $constituents; do
          if [ -e "$i/nix-support/failed" ]; then
            touch "$out/nix-support/failed"
          fi
        done
      '';

      meta = meta // {
        isHydraChannel = true;
      };
    } // removeAttrs args [ "meta" ]);

}
