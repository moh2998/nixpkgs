import ../../../tests/make-test.nix ({ ... }:
{
  name = "kibana";

  nodes = {
    master =
      { pkgs, config, ... }:
      {

        imports = [
          ./setup.nix
          ../static/default.nix
          ../roles/default.nix
          ../services/default.nix
          ../platform/default.nix
        ];

        virtualisation.memorySize = 2048;
        flyingcircus.roles.elasticsearch6.enable = true;
        flyingcircus.roles.kibana.enable = true;
        flyingcircus.roles.kibana.elasticSearchUrl = "http://localhost:9200/";

      };
  };

  testScript = ''
    startAll;

    $master->waitForUnit("kibana");

    # cluster healthy?
    $master->succeed(<<EOF
      for count in {0..300}; do
        curl -s "localhost:5601/api/status" |  grep -q '"state":"green' && exit
        echo "Checking $count" | logger
        sleep 1
      done
      echo "Failed after $count tries" | logger
      exit 1
    EOF
    );
  '';
})
