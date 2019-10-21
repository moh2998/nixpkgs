import ../../../tests/make-test.nix ({ ... }:
{
  name = "kibana";

  machine =
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

  testScript = ''
    startAll;

    $machine->waitForUnit("elasticsearch");
    $machine->waitForUnit("kibana");

    my $statusCheck = <<'END'; 
      for count in {0..100}; do
        echo "Checking..." | logger -t kibana-status
        curl -s "localhost:5601/api/status" | grep -q '"state":"green' && exit
        sleep 5
      done
      echo "Failed" | logger -t kibana-status
      curl -s "localhost:5601/api/status"
      exit 1
    END

    subtest "cluster healthy?", sub {
      $machine->succeed($statusCheck);
    };

    subtest "killing the kibana process should trigger an automatic restart", sub {
      $machine->succeed("kill -9 \$(systemctl show kibana.service --property MainPID | sed -e 's/MainPID=//')");
      $machine->waitForUnit("kibana");
      $machine->succeed($statusCheck);
    };
  '';
})
