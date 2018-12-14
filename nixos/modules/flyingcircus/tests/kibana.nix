import ../../../tests/make-test.nix ({ ... }:
{
  name = "kibana";

  nodes = {
    kib =
      { pkgs, config, ... }:
      {

        imports = [
          ./setup.nix
          ../static/default.nix
          ../roles/default.nix
          ../services/default.nix
          ../platform/default.nix
        ];

        virtualisation.memorySize = 3072;
        virtualisation.qemu.options = [ "-smp 2" ];
        flyingcircus.roles.elasticsearch6.enable = true;
        flyingcircus.roles.kibana.enable = true;
        flyingcircus.roles.kibana.elasticSearchUrl = "http://localhost:9200/";
      };
  };

  testScript = ''
    startAll;

    $kib->waitForUnit("elasticsearch");
    $kib->waitForUnit("kibana");

    # cluster healthy?
    $kib->succeed(<<'__EOF__'
      for count in {0..100}; do
        echo "Checking..." | logger -t kibana-status
        curl -s "localhost:5601/api/status" | grep -q '"state":"green' && exit
        sleep 5
      done
      echo "Failed" | logger -t kibana-status
      curl -s "localhost:5601/api/status"
      exit 1
    __EOF__
    );
  '';
})
