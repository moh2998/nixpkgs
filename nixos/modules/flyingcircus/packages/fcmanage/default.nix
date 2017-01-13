{ pkgs
, dmidecode
, fcmaintenance
, gptfdisk
, lvm2
, multipath_tools
, nix
, python34Packages
, utillinux
, xfsprogs }:

let
  py = python34Packages;
  click = py.buildPythonPackage {
    name = "click-6.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz";
      sha256 = "cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9";
    };
    doCheck = false;
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A simple wrapper around optparse for powerful command line utilities.";
    };
  };
in
py.buildPythonPackage rec {
  name = "fc-manage-${version}";
  version = "1.0";
  namePrefix = "";
  dontStrip = true;
  src = ./.;

  buildInputs = [
    py.mock
    py.pytest
  ];

  propagatedBuildInputs = [
    click
    dmidecode
    fcmaintenance
    gptfdisk
    lvm2
    multipath_tools
    nix
    py.fcutil
    py.requests2
    utillinux
    xfsprogs
  ];

}
