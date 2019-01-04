{ config, lib, pkgs, ... }: with lib;

let
  cfg = config.flyingcircus.roles.elasticsearch;
  cfg_service = config.services.elasticsearch;
  fclib = import ../lib;

  esVersion =
    if config.flyingcircus.roles.elasticsearch6.enable
    then "6"
    else if config.flyingcircus.roles.elasticsearch5.enable
    then "5"
    else null;

  package = versionConfiguration.${esVersion}.package;
  enabled = esVersion != null;

  versionConfiguration = {
    "5" = {
      package = pkgs.elasticsearch5;
      serviceName = "elasticsearch5-node";
    };
    "6" = {
      package = pkgs.elasticsearch6;
      serviceName = "elasticsearch6-node";
    };
    null = {
      package = null;
      serviceName = null;
    };
  };

  esNodes =
    if cfg.esNodes == null
    then map
      (service: service.address)
      (filter
        (s: s.service == versionConfiguration.${esVersion}.serviceName
         || s.service == "elasticsearch-node")  # XXX remove after finishing migraiton
        config.flyingcircus.enc_services)
    else cfg.esNodes;

  thisNode =
    if config.networking.domain != null
    then "${config.networking.hostName}.${config.networking.domain}"
    else "localhost";

  defaultClusterName = config.networking.hostName;

  clusterName =
    if cfg.clusterName == null
    then (fclib.configFromFile /etc/local/elasticsearch/clusterName defaultClusterName)
    else cfg.clusterName;

  additionalConfig =
    fclib.configFromFile /etc/local/elasticsearch/elasticsearch.yml "";

  currentMemory = fclib.current_memory config 1024;

  esHeap = fclib.min
    [ (currentMemory * cfg.heapPercentage / 100)
      (31 * 1024)];

in
{

  options = {

    flyingcircus.roles.elasticsearch = {

      clusterName = mkOption {
        type = types.nullOr types.string;
        default = null;
        description = ''
          The clusterName elasticsearch will use.
        '';
      };

      dataDir = mkOption {
        type = types.path;
        default = "/srv/elasticsearch";
        description = ''
          Data directory for elasticsearch.
        '';
      };

      heapPercentage = mkOption {
        type = types.int;
        default = 50;
        description = ''
          Tweak amount of memory to use for ES heap
          (systemMemory * heapPercentage / 100)
        '';
      };

      esNodes = mkOption {
        type = types.nullOr (types.listOf types.string);
        default = null;
      };

    };

    flyingcircus.roles.elasticsearch5 = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable the Flying Circus elasticsearch5 role.";
      };
    };

    flyingcircus.roles.elasticsearch6 = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable the Flying Circus elasticsearch6 role.";
      };
    };

  };

  config = mkMerge [
    (mkIf enabled {

    services.elasticsearch = {
      enable = true;
      package = package;
      listenAddress = thisNode;
      dataDir = cfg.dataDir;
      cluster_name = clusterName;
      extraJavaOptions = [
       "-Des.path.scripts=${cfg_service.dataDir}/scripts"
       "-Des.security.manager.enabled=false"
        "-Xms${toString esHeap}m"
        "-Xmx${toString esHeap}m"
      ];
      extraConf = ''
        node.name: ${config.networking.hostName}
        discovery.zen.ping.unicast.hosts: ${builtins.toJSON esNodes}
        bootstrap.memory_lock: true
        ${additionalConfig}
      '';
    };

    systemd.services.elasticsearch = {
      serviceConfig = {
        LimitMEMLOCK = "infinity";
        Restart = "always";
      };
      preStart = mkAfter ''
        # Install scripts
        mkdir -p ${cfg_service.dataDir}/scripts
      '';
      postStart = let
        url = "http://${thisNode}:9200/_cat/health";
        in ''
        # Wait until available for use
        for count in {0..120}; do
            ${pkgs.curl}/bin/curl -s ${url} && exit
            echo "Trying to connect to ${url} for ''${count}s"
            sleep 1
        done
        echo "No connection to ${url} for 120s, giving up"
        exit 1
      '';
    };

    system.activationScripts.fcio-elasticsearch = ''
      install -d -o ${toString config.ids.uids.elasticsearch} -g service -m 02775 \
        /etc/local/elasticsearch/
    '';

    environment.etc."local/elasticsearch/README.txt".text = ''
      Elasticsearch is running on this VM.

      It is forming the cluster named ${clusterName}
      To change the cluster name, add a file named "clusterName" here, with the
      cluster name as its sole contents.

      To add additional configuration options, create a file "elasticsearch.yml"
      here. Its contents will be appended to the base configuration.
    '';

    flyingcircus.services.sensu-client.checks = {

      es_circuit_breakers = {
        notification = "ES: Circuit Breakers active";
        command = "check-es-circuit-breakers.rb -h ${thisNode}";
        interval = 300;
      };

      es_cluster_health = {
        notification = "ES: Cluster Health";
        command = "check-es-cluster-health.rb -h ${thisNode}";
      };

      es_file_descriptor = {
        notification = "ES: File descriptors in use";
        command = "check-es-file-descriptors.rb -h ${thisNode}";
        interval = 300;
      };

      es_heap = {
        notification = "ES: Heap too full";
        command = "check-es-heap.rb -h ${thisNode} -w 80 -c 90 -P";
        interval = 300;
      };

      es_node_status = {
        notification = "ES: Node status";
        command = "check-es-node-status.rb -h ${thisNode}";
      };

      es_shard_allocation_status = {
        notification = "ES: Shard allocation status";
        command = "check-es-shard-allocation-status.rb -s ${thisNode}";
        interval = 300;
      };

    };

    systemd.services.prometheus-elasticsearch-exporter = {
      description = "Prometheus exporter for elasticsearch metrics";
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.prometheus-elasticsearch-exporter ];
      script = ''
        exec elasticsearch_exporter\
            --es.uri http://${thisNode}:9200 \
            --web.listen-address localhost:9108
      '';
      serviceConfig = {
        User = "nobody";
        Restart = "always";
        PrivateTmp = true;
        WorkingDirectory = /tmp;
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
      };
    };

    services.telegraf.inputs = {
      prometheus  = [{
        urls = [ "http://localhost:9108/metrics" ];
      }];
    };
  })

  {
    flyingcircus.roles.statshost.globalAllowedMetrics = [ "elasticsearch" ];
  }

  ];
}
