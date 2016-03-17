{ ... }:

{
  nixpkgs.config.packageOverrides = pkgs: rec {

    boost159 = pkgs.callPackage ./boost-1.59.nix { };

    fcagent = pkgs.callPackage ./fcagent.nix { };
    nagiosplugin = pkgs.callPackage ./nagiosplugin.nix { };

    percona = pkgs.callPackage ./percona.nix { boost = boost159; };
    qemu = pkgs.callPackage ./qemu-2.5.nix {
      inherit (pkgs.darwin.apple_sdk.frameworks) CoreServices Cocoa;
      x86Only = true;
    };

    sensu = pkgs.callPackage ./sensu { };
    uchiwa = pkgs.callPackage ./uchiwa { };

    stdenv = pkgs.stdenv // {
      platform = pkgs.stdenv.platform // {
        kernelExtraConfig =
        ''
        DEBUG_INFO y
        LATENCYTOP y
        SCHEDSTATS y
        '';
      };
    };

  };
}
