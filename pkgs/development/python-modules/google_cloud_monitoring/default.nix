{ stdenv
, buildPythonPackage
, fetchPypi
, google_api_core
, pandas
, pytest
, mock
}:

buildPythonPackage rec {
  pname = "google-cloud-monitoring";
  version = "0.31.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "ac0a7657a11459894abf35d3e35e804df0fb81ef35bc18f80199d4ce02440c2d";
  };

  checkInputs = [ pytest mock ];
  propagatedBuildInputs = [ google_api_core pandas ];

  checkPhase = ''
    pytest tests/unit
  '';

  meta = with stdenv.lib; {
    description = "Stackdriver Monitoring API client library";
    homepage = https://github.com/GoogleCloudPlatform/google-cloud-python;
    license = licenses.asl20;
    maintainers = [ maintainers.costrouc ];
  };
}
