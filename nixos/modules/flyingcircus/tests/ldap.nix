import ../../../tests/make-test.nix ({ pkgs, ... }:
let
    suffix = "dc=example,dc=com";
in {
  name = "ldap";
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

    flyingcircus.roles.ldap.enable = true;
    flyingcircus.roles.ldap.suffix = suffix;

  };

  testScript = ''
    $machine->start;
    $machine->waitForUnit("openldap");

    $machine->succeed(<<__TEST__);
      ${pkgs.nagiosPluginsOfficial}/bin/check_ldap \\
          -3 -H localhost -w 2 -c 4 -b ${suffix} \\
          -D cn=Reader,${suffix} \\
          -P "\$(< /etc/local/ldap/password.reader)" -4
    __TEST__

    $machine->succeed(<<__TEST__);
      ${pkgs.nagiosPluginsOfficial}/bin/check_ldap \\
          -3 -H localhost -w 2 -c 4 -b ${suffix} \\
          -D cn=Manager,${suffix} \\
          -P "\$(< /etc/local/ldap/password.manager)" -6
    __TEST__

  '';
})

