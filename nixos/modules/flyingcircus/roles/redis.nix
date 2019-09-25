{ config, pkgs, lib, ... }:

let
  cfg = config.flyingcircus.roles;

in
{
  options.flyingcircus.roles = {
    redis4.enable = lib.mkEnableOption "Flying Circus Redis v4";
    redis.enable = lib.mkEnableOption "Flying Circus Redis (default version)";
  };

  config = lib.mkMerge [
    {
      flyingcircus.services.redis.enable =
        assert !(cfg.redis.enable && cfg.redis4.enable);
        cfg.redis.enable || cfg.redis4.enable;

      flyingcircus.roles.statshost.globalAllowedMetrics = [ "redis" ];

      flyingcircus.roles.statshost.prometheusMetricRelabel = [
        { regex = "aof_last_bgrewrite_status|aof_last_write_status|maxmemory_policy|rdb_last_bgsave_status|used_memory_dataset_perc|used_memory_peak_perc";
          action = "labeldrop";
        }
      ];
    }

    (lib.mkIf cfg.redis4.enable {
      flyingcircus.services.redis.package = pkgs.redis4;
    })
  ];
}
