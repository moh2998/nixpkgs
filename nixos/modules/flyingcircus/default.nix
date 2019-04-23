# Transitional FC module
# This code is used only once when switching from the 15.09 monorepo to 18.09
# plus overlay.
{ config, ... }:
{
  imports = [
    <fc/nixos/infrastructure>
    <fc/nixos/lib>
    <fc/nixos/platform>
    <fc/nixos/services>
    <fc/nixos/version.nix>
    <fc/nixos/roles>
  ];

  config = {
    environment = {
      etc."nixos/configuration.nix".text =
        import <fc/nixos/etc_nixos_configuration.nix> { inherit config; };
    };

    nixpkgs.overlays = [ (import <fc/pkgs/overlay.nix>) ];

    flyingcircus.infrastructureModule = "flyingcircus";
  };
}
