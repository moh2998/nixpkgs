# This test has been broken but still signaled "green" earlier on.
# I have disabled it for now.
import ../../../tests/make-test.nix ({ ... }:
{
  name = "rabbitmq";

  machine =
    { pkgs, config, ... }:
    {
      imports = [
        ./setup.nix
        ../static
        ../services
        ../platform
      ];

      services.rabbitmq.enable = true;
    };

  testScript = ''
    startAll;
    $machine->waitForUnit("rabbitmq");

    my $statusCheck = <<'_EOT_';
      export HOME=/var/lib/rabbitmq
      rabbitmqctl status | tee /dev/stderr | egrep 'uptime,[1-9]'
    _EOT_

    subtest "rabbitmq healthy?", sub {
      $machine->succeed($statusCheck);
    };

    subtest "killing the rabbitmq process should trigger an automatic restart", sub {
      $machine->succeed("kill -9 \$(systemctl show rabbitmq.service --property MainPID | sed -e 's/MainPID=//')");
      $machine->waitForUnit("rabbitmq");
      $machine->succeed($statusCheck);
    };
  '';
})
