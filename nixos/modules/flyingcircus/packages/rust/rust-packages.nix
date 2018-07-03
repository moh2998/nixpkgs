# This file defines the source of Rust / cargo's crates registry
#
# buildRustPackage will automatically download dependencies from the registry
# version that we define here. If you're having problems downloading / finding
# a Rust library, try updating this to a newer commit.
{ stdenv, fetchFromGitHub, git }:

stdenv.mkDerivation rec {
  version = "76bfa00";
  name = "rustRegistry-${version}";

  src = fetchFromGitHub {
    owner = "rust-lang";
    repo = "crates.io-index";
    rev = version;
    sha256 = "1qd48frwy6rr4ssyi1s058yn1w0mmbhjd0gwwn7hlgizdvm32z5f";
  };
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
    cd $out
    git="${git}/bin/git"

    $git init
    $git config --local user.email "example@example.com"
    $git config --local user.name "example"
    $git add .
    $git commit --quiet -m 'Rust registry commit'

    touch $out/touch . "$out/.cargo-index-lock"
  '';
}
