# This file defines the source of Rust / cargo's crates registry
#
# buildRustPackage will automatically download dependencies from the registry
# version that we define here. If you're having problems downloading / finding
# a Rust library, try updating this to a newer commit.
{ stdenv, fetchFromGitHub, git }:

stdenv.mkDerivation rec {
  version = "f09432f";
  name = "rustRegistry-${version}";

  src = fetchFromGitHub {
    owner = "rust-lang";
    repo = "crates.io-index";
    rev = version;
    sha256 = "19lsw9y4hhi3231j5x8qcrn2fx0xifivjp010xs57yy91784gb01";
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
