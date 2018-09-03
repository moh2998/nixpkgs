import ../../../../tests/make-test.nix ({ pkgs, ... }:
{
  name = "apache";
  nodes = {
    machine =
      { config, lib, ... }:
      {
        imports = [
          ../setup.nix
          ../../platform
          ../../roles
          ../../services
          ../../static
        ];
        flyingcircus.roles.apache.enable = true;
        systemd.services.httpd.preStart = ''
          # Install scripts
          mkdir -p /tmp/example
          '';
        services.httpd.extraConfig = ''
          Listen 8000
          DocumentRoot /tmp/example
          <VirtualHost *:8000>
            ServerName "foo.example.com"
            <Directory "/tmp/example">
              AllowOverride all
              Require all granted
              Options FollowSymlinks
              DirectoryIndex index.html index.php
            </Directory>
          </VirtualHost>
        '';
      };
  };
  testScript = ''
    $machine->start;
    $machine->waitForUnit("httpd");

    $machine->execute(<<__SETUP__);

    echo 'Hello!World!' > /tmp/example/hello.txt
    __SETUP__

    $machine->succeed("curl -s http://localhost:8000/hello.txt | grep \"Hello.World\" >/dev/console ");

  '';
})

