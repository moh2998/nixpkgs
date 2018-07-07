{ stdenv, fetchurl, callPackage }:

let
  # Note: the version MUST be one version prior to the version we're
  # building
  version = "1.27.0";

  # fetch hashes by running `print-hashes.sh $version`
  hashes = {
    i686-unknown-linux-gnu = "c4eccd56b4054b17d3f62cb210636ba6b9b24e2746f20599a2993f3db8e4262d";
    x86_64-unknown-linux-gnu = "235ad78e220b10a2d0267aea1e2c0f19ef5eaaff53ad6ff8b12c1d4370dec9a3";
    armv7-unknown-linux-gnueabihf = "e715b6f7af882efdc307e291e4321d01016ff32099a5d7a766c187e01ca5978b";
    aarch64-unknown-linux-gnu = "e74ebc33dc3fc19e501a677a87b619746efdba2901949a0319176352f556673a";
    i686-apple-darwin = "a666a446004fd6a5a5a626663fb08712f9d378d00d795f1eb90a95944701c2a8";
    x86_64-apple-darwin = "a1d48190992e01aac1a181bce490c80cb2c1421724b4ff0e2fb7e224a958ce0f";
  };

  platform =
    if stdenv.system == "i686-linux"
    then "i686-unknown-linux-gnu"
    else if stdenv.system == "x86_64-linux"
    then "x86_64-unknown-linux-gnu"
    else if stdenv.system == "armv7l-linux"
    then "armv7-unknown-linux-gnueabihf"
    else if stdenv.system == "aarch64-linux"
    then "aarch64-unknown-linux-gnu"
    else if stdenv.system == "i686-darwin"
    then "i686-apple-darwin"
    else if stdenv.system == "x86_64-darwin"
    then "x86_64-apple-darwin"
    else throw "missing bootstrap url for platform ${stdenv.system}";

  src = fetchurl {
     url = "https://static.rust-lang.org/dist/rust-${version}-${platform}.tar.gz";
     sha256 = hashes."${platform}";
  };

in callPackage ./binaryBuild.nix
  { inherit version src platform;
    buildRustPackage = null;
    versionType = "bootstrap";
  }
