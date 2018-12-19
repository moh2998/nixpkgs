{ hydraJob
, system ? builtins.currentSystem
}:

let
  factory = rolename: (hydraJob (esTest rolename { inherit system; }));

  esTest = rolename:
  import ../../../tests/make-test.nix (
    { ... }:
    {
      name = rolename;

      nodes = {
        es =
          { pkgs, config, ... }:
          {
            imports = [
              ./setup.nix
              ../static
              ../roles
              ../services
              ../platform
            ];

            virtualisation.memorySize = 3072;
            virtualisation.qemu.options = [ "-smp 2" ];
            flyingcircus.roles.${rolename}.enable = true;
          };
      };

      testScript = ''
        startAll;

        $es->waitForUnit("elasticsearch");

        # cluster healthy?
        $es->succeed('curl -s "localhost:9200/_cat/health?v" | grep green');

        # simple data round trip
        $es->succeed(<<'__EOF__');
        set -e
        echo -e '\n${rolename}: Creating index'
        curl -s -XPUT 'localhost:9200/customer'
        curl -s 'localhost:9200/_cat/indices?v'

        echo -e '\n${rolename}: Submitting data'
        curl -s -XPUT 'localhost:9200/customer/external/1' \
          -H 'Content-Type: application/json' \
          -d'{ "name": "John Doe" }'

        echo -e '\n${rolename}: Retrieving data'
        curl -s 'localhost:9200/customer/external/1' | grep 'John Doe'
        __EOF__
      '';
    }
  );

in {
  "elasticsearch5" = factory "elasticsearch5";
  "elasticsearch6" = factory "elasticsearch6";
}
