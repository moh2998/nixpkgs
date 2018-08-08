import ../../../tests/make-test.nix ({ pkgs, ... }:
{
  name = "apache";
  nodes = {
    machine =
      { config, lib, ... }:
      {
        imports = [
          ./setup.nix
          ../platform
          ../roles
          ../services
          ../static
        ];
        flyingcircus.roles.apache.enable = true;
        services.httpd.extraConfig = ''
          Listen 8000
          <VirtualHost *:8000>
            ServerName "foo.example.com"
            DocumentRoot /tmp/example
          </VirtualHost>
        '';
      };
  };
  testScript = ''
    $machine->start;
    $machine->waitForUnit("httpd");

    $machine->execute(<<__SETUP__);
    mkdir -p /tmp/example
    echo 'Hello!World!' > hello.txt
    __SETUP__

    $machine->succeed(<<__TEST__) =~ /Hello World!/;
    curl -s http://localhost:8000/hello.txt
    __TEST__
  '';
})

