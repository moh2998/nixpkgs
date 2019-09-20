let
  domainA = "a.example.com";
  domainB = "b.example.com";
in
import ./make-test.nix ({ pkgs, lib, ... }: {
  name = "acme";

  nodes =
  let
    fakeAcme = domain: {
      # A target remains active. Use this to probe the fact that
      # a service fired even though it is not RemainAfterExit

      systemd.targets."acme-finished-${domain}" = {};

      systemd.services."acme-${domain}" = {
        wants = [ "acme-finished-${domain}.target" ];
        before = [ "acme-finished-${domain}.target" ];
        serviceConfig.ExecStart = lib.mkForce (pkgs.writeScript "fake-acme" ''
          #!${pkgs.runtimeShell}
          set -x
          echo "starting fake cert fetch for ${domain}..."
          
          sleep 3
          echo "fetched cert for ${domain}"
        '');
      };
    };

    domainConfig = domain: {
      services.nginx.enable = true;

      services.nginx.virtualHosts."${domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/".root = pkgs.runCommand "docroot" {} ''
          mkdir -p "$out"
          echo hello world from ${domain} > "$out/index.html"
        '';
      };
    } // (fakeAcme domain);
  in 
  {
    client = { nodes, pkgs, ... }: {
      networking.extraHosts = nodes.webserver.config.networking.extraHosts; 
      environment.systemPackages = [ pkgs.curl ];
    };

    webserver = { config, ... }: {
      networking.firewall.allowedTCPPorts = [ 80 443 ];
      networking.extraHosts = ''
        ${config.networking.primaryIPAddress} ${domainA}
        ${config.networking.primaryIPAddress} ${domainB}
      '';
      
      nesting.clone = [ 
        # child-1
        (domainConfig domainA) 

        # child-2
        (lib.mkMerge [
          (domainConfig domainA) 
          (domainConfig domainB) 
        ])
      ];
    };
  };

  testScript =
    # Note, waitForUnit does not work for oneshot services that do not have RemainAfterExit=true,
    # this is because a oneshot goes from inactive => activating => inactive, and never
    # reaches the active state. To work around this, we create some mock target units which
    # get pulled in by the oneshot units. The target units linger after activation, and hence we
    # can use them to probe that a oneshot fired. It is a bit ugly, but it is the best we can do
    ''
      startAll;
      $client->waitForUnit("default.target");

      subtest "add vhost a", sub {
        $webserver->succeed("/run/booted-system/fine-tune/child-1/bin/switch-to-configuration test");
        $webserver->waitForUnit("acme-finished-${domainA}.target");
        $webserver->sleep(4);
        $webserver->succeed("journalctl -b -u acme-${domainA} | grep -qF 'fetched cert for ${domainA}'");
        $client->succeed('curl -k https://${domainA}/ | grep -qF "${domainA}"');
      };

      subtest "add vhost b", sub {
        $webserver->succeed("/run/booted-system/fine-tune/child-2/bin/switch-to-configuration test");
        $webserver->waitForUnit("acme-finished-${domainB}.target");
        $webserver->sleep(4);
        $webserver->succeed("journalctl -b -u acme-${domainB} | grep -qF 'fetched cert for ${domainB}'");
        $client->succeed('curl -k https://${domainB}/ | grep -qF "${domainB}"');
      };

      subtest "back to a only", sub {
        $webserver->succeed("/run/booted-system/fine-tune/child-1/bin/switch-to-configuration test");
        $client->succeed('curl -k https://${domainA}/ | grep -qF "${domainA}"');
        $client->mustFail('curl -k https://${domainB}/ | grep -qF "${domainB}"');
      };
    '';
})
