 import ../../../../tests/make-test.nix ({ ... }:
 {
   name = "atomic-firewall";
   nodes = {
     afw =
       { pkgs, config, ... }:
       {
         imports = [
           ../setup.nix
           ../../platform
           ../../services
           ../../static
         ];
         config = {
            flyingcircus.firewall.localDir = ./rules;
            networking.extraHosts = ''
               192.0.2.1 example.com
               2001:db8::1 example.com
            '';
         };
       };
   };
   testScript = ''
     $afw->waitForUnit("firewall");

     # check that nixos-fw is active at all
     $afw->succeed("iptables -L INPUT -nv") =~ /0\s+0\s+nixos-fw/ || die;
     $afw->succeed("ip6tables -L INPUT -nv") =~ /0\s+0\s+nixos-fw/ || die;

     my $ip4t = $afw->succeed("iptables -L nixos-fw -nv");
     my $ip6t = $afw->succeed("ip6tables -L nixos-fw -nv");

     # port 2827 should be present in iptables rules
     $ip4t =~ /custom-drop.*192\.0\.2\.1.*tcp dpt:2827/
       || die "IPv4 rule not present";
     $ip6t =~ /custom-drop.*2001:db8::1.*tcp dpt:2827/
       || die "IPv6 rule not present";

     # port 3097 from `ignore~` should not be present
     $ip4t !~ /tcp dpt:3097/
       || die "IPv4 rule from ignored file present but shouldn\'t";
     $ip6t !~ /tcp dpt:3097/
       || die "IPv6 rule from ignored file present but shouldn\'t";

     # check rules save files' existence
     my $rules4 = $afw->succeed("cat /var/lib/firewall/iptables-save");
     my $rules6 = $afw->succeed("cat /var/lib/firewall/ip6tables-save");

     # check rules save files' contents
     $rules4 =~ /-A nixos-fw -s 192\.0\.2\.1.32 -p tcp .* --dport 2827 -j custom-drop/
       || die "IPv4 rules save file content mismatch";
     $rules6 =~ /-A nixos-fw -s 2001:db8::1.128 -p tcp .* --dport 2827 -j custom-drop/
       || die "IPv6 rules save file content mismatch";
   '';
 })
