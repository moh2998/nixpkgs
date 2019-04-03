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
    }

    (lib.mkIf cfg.redis4.enable {
      flyingcircus.services.redis.package = pkgs.redis4;
    })
  ];
}
