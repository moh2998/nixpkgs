import ../../../../tests/make-test.nix ({ pkgs, ... }:
{
  name = "apache_mode_php56";
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
        services.httpd.enablePHP = true;
        services.httpd.phpPackage = (pkgs.php56.override {
          config.php.xsl = true;
          config.php.pcntl = true;
          config.php.bz2 = true;
          config.php.soap = true;
          config.php.zts = true;
          config.php.mcrypt = true;
        });
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

    echo '<?php phpinfo(); ?>' > /tmp/example/info.php
    __SETUP__

    $machine->succeed("curl -s http://localhost:8000/info.php | grep \"PHP Version\"  >/dev/console ");

  '';
})

