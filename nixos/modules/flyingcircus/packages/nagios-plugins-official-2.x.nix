{ pkgs }:

(pkgs.callPackage
  ../../../../pkgs/servers/monitoring/nagios/plugins/official-2.x.nix { })
.overrideDerivation
  (old: {
    buildInputs = [ pkgs.openssh pkgs.perl pkgs.mariadb ];
    nativeBuildInputs = [ pkgs.openldap ];
    preConfigure= ''
      sed -i -e 's#mysql.h#mysql/mysql.h#' \
             -e 's#mysqld_error.h#mysql/mysqld_error.h#' \
             -e 's#errmsg.h#mysql/errmsg.h#' \
             plugins/check_mysql.c plugins/check_mysql_query.c

      configureFlagsArray=(
        --with-openssl=${pkgs.openssl}
        --with-ping-command='/var/setuid-wrappers/ping -n -w %d -c %d %s'
        --with-ping6-command='/var/setuid-wrappers/ping6 -n -w %d -c %d %s'
        # Don't add dependency to postfix or alike. If the test should
        # be run, some mailer daemon needs to be installed.
        --with-mailq-command=/run/current-system/sw/bin/mailq
      )
    '';
  })
