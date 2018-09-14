{
  activesupport = {
    dependencies = ["i18n" "minitest" "thread_safe" "tzinfo"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0s12j8vl8vrxfngkdlz9g8bpz9akq1z42d57mx5r537b2pji8nr7";
      type = "gem";
    };
    version = "4.2.10";
  };
  addressable = {
    dependencies = ["public_suffix"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0viqszpkggqi8hq87pqp0xykhvz60g99nwmkwsb0v45kc2liwxvk";
      type = "gem";
    };
    version = "2.5.2";
  };
  amq-protocol = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1rpn9vgh7y037aqhhp04smihzr73vp5i5g6xlqlha10wy3q0wp7x";
      type = "gem";
    };
    version = "2.0.1";
  };
  amqp = {
    dependencies = ["amq-protocol" "eventmachine"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0kbrqnpjgj9v0722p3n5rw589l4g26ry8mcghwc5yr20ggkpdaz9";
      type = "gem";
    };
    version = "1.6.0";
  };
  aws-es-transport = {
    dependencies = ["aws-sdk" "elasticsearch" "faraday" "faraday_middleware"];
    source = {
      sha256 = "1r2if0jcbw3xx019fs6lqkz65nffwgh7hjbh5fj13hi09g505m3m";
      type = "gem";
    };
    version = "0.1.4";
  };
  aws-sdk = {
    dependencies = ["aws-sdk-resources"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0wxvkzn7nsp5r09z3428cmzzzpkjdqmcwgwsfmm3clb93k9ivchv";
      type = "gem";
    };
    version = "2.4.4";
  };
  aws-sdk-core = {
    dependencies = ["jmespath"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0v624h6yv28vbmcskx6n67blzq2an0171wcppkr3sx335wi4hriw";
      type = "gem";
    };
    version = "2.4.4";
  };
  aws-sdk-resources = {
    dependencies = ["aws-sdk-core"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1a1lxkig0d2ihv8f581nq65z4b2cf89mg753mvkh8b1kh9ipybx4";
      type = "gem";
    };
    version = "2.4.4";
  };
  aws-ses = {
    dependencies = ["builder" "mail" "mime-types" "xml-simple"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0dssck23xhm1x4lz9llflvxc5hi17zpgshb32p9xpja7kwv035pf";
      type = "gem";
    };
    version = "0.6.0";
  };
  bson = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "07baxjrd8rb5gfsv7hh1akjqcpwih76f1711bwjzp228c79ny2na";
      type = "gem";
    };
    version = "4.3.0";
  };
  builder = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0qibi5s67lpdv1wgcj66wcymcr04q6j4mzws6a479n0mlrmh5wr1";
      type = "gem";
    };
    version = "3.2.3";
  };
  childprocess = {
    dependencies = ["ffi"];
    source = {
      sha256 = "1lv7axi1fhascm9njxh3lx1rbrnsm8wgvib0g7j26v4h1fcphqg0";
      type = "gem";
    };
    version = "0.5.8";
  };
  concurrent-ruby = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "183lszf5gx84kcpb779v6a2y0mx9sssy8dgppng1z9a505nj1qcf";
      type = "gem";
    };
    version = "1.0.5";
  };
  cookiejar = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0q0kmbks9l3hl0wdq744hzy97ssq9dvlzywyqv9k9y1p3qc9va2a";
      type = "gem";
    };
    version = "0.3.3";
  };
  dalli = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "13c8bg9x2knvh2alk5y97qqilgp3hh6cnmnjs1bfwi3p1dczd1mv";
      type = "gem";
    };
    version = "2.7.8";
  };
  dentaku = {
    source = {
      sha256 = "18ga010bbhsgc876vf6z6swfnk2mgj30y96rcd4yafvmwnj5djgz";
      type = "gem";
    };
    version = "2.0.4";
  };
  dnsbl-client = {
    source = {
      sha256 = "1357r0y8xfnay05l9h26rrcqrjlnz0hy421g18pfrwm1psf3pp04";
      type = "gem";
    };
    version = "1.0.2";
  };
  dnsruby = {
    dependencies = ["addressable"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "04sxvjif1pxmlf02mj3hkdb209pq18fv9sr2p0mxwi0dpifk6f3x";
      type = "gem";
    };
    version = "1.61.2";
  };
  domain_name = {
    dependencies = ["unf"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0abdlwb64ns7ssmiqhdwgl27ly40x2l27l8hs8hn0z4kb3zd2x3v";
      type = "gem";
    };
    version = "0.5.20180417";
  };
  elasticsearch = {
    dependencies = ["elasticsearch-api" "elasticsearch-transport"];
    source = {
      sha256 = "1wdy17i56b4m7akp7yavnr8vhfhyz720waphmixq05dj21b11hl0";
      type = "gem";
    };
    version = "1.0.18";
  };
  elasticsearch-api = {
    dependencies = ["multi_json"];
    source = {
      sha256 = "1v6nb3ajz5rack3p4b4nz37hs0zb9x738h2ms8cc4plp6wqh1w5s";
      type = "gem";
    };
    version = "1.0.18";
  };
  elasticsearch-transport = {
    dependencies = ["faraday" "multi_json"];
    source = {
      sha256 = "0smfrz8nq49hgf67y5ayxa9i4rmmi0q4m51l0h499ykq4cvcwv6i";
      type = "gem";
    };
    version = "1.0.18";
  };
  em-http-request = {
    dependencies = ["addressable" "cookiejar" "em-socksify" "eventmachine" "http_parser.rb"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "13rxmbi0fv91n4sg300v3i9iiwd0jxv0i6xd0sp81dx3jlx7kasx";
      type = "gem";
    };
    version = "1.1.5";
  };
  em-http-server = {
    dependencies = ["eventmachine"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0y8l4gymy9dzjjchjav90ck6has2i2zdjihlhcyrg3jgq6kjzyq5";
      type = "gem";
    };
    version = "0.1.8";
  };
  em-socksify = {
    dependencies = ["eventmachine"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0rk43ywaanfrd8180d98287xv2pxyl7llj291cwy87g1s735d5nk";
      type = "gem";
    };
    version = "0.3.2";
  };
  em-worker = {
    dependencies = ["eventmachine"];
    source = {
      sha256 = "0z4jx9z2q5hxvdvik4yp0ahwfk69qsmdnyp72ln22p3qlkq2z5wk";
      type = "gem";
    };
    version = "0.0.2";
  };
  erubis = {
    source = {
      sha256 = "1fj827xqjs91yqsydf0zmfyw9p4l2jz5yikg3mppz6d7fi8kyrb3";
      type = "gem";
    };
    version = "2.7.0";
  };
  eventmachine = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "075hdw0fgzldgss3xaqm2dk545736khcvv1fmzbf1sgdlkyh1v8z";
      type = "gem";
    };
    version = "1.2.5";
  };
  faraday = {
    dependencies = ["multipart-post"];
    source = {
      sha256 = "1kplqkpn2s2yl3lxdf6h7sfldqvkbkpxwwxhyk7mdhjplb5faqh6";
      type = "gem";
    };
    version = "0.9.2";
  };
  faraday_middleware = {
    dependencies = ["faraday"];
    source = {
      sha256 = "18jndnpls6aih57rlkzdq94m5r7zlkjngyirv01jqlxll8jy643r";
      type = "gem";
    };
    version = "0.10.1";
  };
  ffi = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0c2dl10pi6a30kcvx2s6p2v1wb4kbm48iv38kmz2ff600nirhpb8";
      type = "gem";
    };
    version = "1.9.21";
  };
  http-cookie = {
    dependencies = ["domain_name"];
    source = {
      sha256 = "004cgs4xg5n6byjs7qld0xhsjq3n6ydfh897myr2mibvh6fjc49g";
      type = "gem";
    };
    version = "1.0.3";
  };
  "http_parser.rb" = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "15nidriy0v5yqfjsgsra51wmknxci2n2grliz78sf9pga3n0l7gi";
      type = "gem";
    };
    version = "0.6.0";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "038qvz7kd3cfxk8bvagqhakx68pfbnmghpdkx7573wbf0maqp9a3";
      type = "gem";
    };
    version = "0.9.5";
  };
  inifile = {
    source = {
      sha256 = "1c5zmk7ia63yw5l2k14qhfdydxwi1sah1ppjdiicr4zcalvfn0xi";
      type = "gem";
    };
    version = "3.0.0";
  };
  jmespath = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1d4wac0dcd1jf6kc57891glih9w57552zgqswgy74d1xhgnk0ngf";
      type = "gem";
    };
    version = "1.4.0";
  };
  json = {
    source = {
      sha256 = "0qmj7fypgb9vag723w1a49qihxrcf5shzars106ynw2zk352gbv5";
      type = "gem";
    };
    version = "1.8.6";
  };
  mail = {
    dependencies = ["mime-types"];
    source = {
      sha256 = "1nbg60h3cpnys45h7zydxwrl200p7ksvmrbxnwwbpaaf9vnf3znp";
      type = "gem";
    };
    version = "2.6.3";
  };
  mailgun-ruby = {
    dependencies = ["json" "rest-client"];
    source = {
      sha256 = "1aqa0ispfn27g20s8s517cykghycxps0bydqargx7687w6d320yb";
      type = "gem";
    };
    version = "1.0.3";
  };
  mime-types = {
    source = {
      sha256 = "03j98xr0qw2p2jkclpmk7pm29yvmmh0073d8d43ajmr0h3w7i5l9";
      type = "gem";
    };
    version = "2.99.3";
  };
  minitest = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0icglrhghgwdlnzzp4jf76b0mbc71s80njn5afyfjn4wqji8mqbq";
      type = "gem";
    };
    version = "5.11.3";
  };
  mixlib-cli = {
    source = {
      sha256 = "0647msh7kp7lzyf6m72g6snpirvhimjm22qb8xgv9pdhbcrmcccp";
      type = "gem";
    };
    version = "1.7.0";
  };
  mongo = {
    dependencies = ["bson"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "07gs4ll8hm1paj3liblpy0zqxidvcxb76cxa47l0i23mbf5hp46v";
      type = "gem";
    };
    version = "2.4.1";
  };
  multi_json = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1rl0qy4inf1mp8mybfk56dfga0mvx97zwpmq5xmiwl5r770171nv";
      type = "gem";
    };
    version = "1.13.1";
  };
  multipart-post = {
    source = {
      sha256 = "09k0b3cybqilk1gwrwwain95rdypixb2q9w65gd44gfzsd84xi1x";
      type = "gem";
    };
    version = "2.0.0";
  };
  net-ping = {
    source = {
      sha256 = "19p3d39109xvbr4dcjs3g3zliazhc1k3iiw69mgb1w204hc7wkih";
      type = "gem";
    };
    version = "1.7.8";
  };
  netrc = {
    source = {
      sha256 = "0gzfmcywp1da8nzfqsql2zqi648mfnx6qwkig3cv36n9m0yy676y";
      type = "gem";
    };
    version = "0.11.0";
  };
  oj = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "147whmq8h2n04chskl3v4a132xhz5i6kk6vhnz83jwng4vihin5f";
      type = "gem";
    };
    version = "2.18.1";
  };
  ox = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0rar0xr5qn3zac1r2z18kmpapx121c2l3z8jsgh60vsddwzpdh7h";
      type = "gem";
    };
    version = "2.5.0";
  };
  parse-cron = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "02fj9i21brm88nb91ikxwxbwv9y7mb7jsz6yydh82rifwq7357hg";
      type = "gem";
    };
    version = "0.1.4";
  };
  pg = {
    source = {
      sha256 = "00g33hdixgync6gp4mn0g0kjz5qygshi47xw58kdpd9n5lzdpg8c";
      type = "gem";
    };
    version = "0.18.3";
  };
  public_suffix = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "040jf98jpp6w140ghkhw2hvc1qx41zvywx5gj7r2ylr1148qnj7q";
      type = "gem";
    };
    version = "2.0.5";
  };
  redis = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0i415x8gi0c5vsiy6ikvx5js6fhc4x80a5lqv8iidy2iymd20irv";
      type = "gem";
    };
    version = "3.3.5";
  };
  rest-client = {
    dependencies = ["http-cookie" "mime-types" "netrc"];
    source = {
      sha256 = "1m8z0c4yf6w47iqz6j2p7x1ip4qnnzvhdph9d5fgx081cvjly3p7";
      type = "gem";
    };
    version = "1.8.0";
  };
  ruby-dbus = {
    source = {
      sha256 = "1ga8q959i8j8iljnw9hgxnjlqz1q0f95p9r3hyx6r5fl657qbx8z";
      type = "gem";
    };
    version = "0.11.0";
  };
  ruby-mysql = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0agxhs8ghmhnwvy6f8pb2wgynrlpjkcy9nqjxx8clw21k436b5nk";
      type = "gem";
    };
    version = "2.9.14";
  };
  ruby-ntlm = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1xg4wjxhv19n04q8knb2ac9mmdiqp88rc1dkzdxcmy0wrn2w2j0n";
      type = "gem";
    };
    version = "0.0.3";
  };
  ruby-supervisor = {
    source = {
      sha256 = "07g0030sb9psrnz3b8axyjrcgwrmd38p0m05nq24bvrlvav4vkc0";
      type = "gem";
    };
    version = "0.0.2";
  };
  sensu = {
    dependencies = ["em-http-request" "em-http-server" "eventmachine" "parse-cron" "sensu-extension" "sensu-extensions" "sensu-json" "sensu-logger" "sensu-redis" "sensu-settings" "sensu-spawn" "sensu-transport"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "16qf1xkp9mrrchjvskhzl4kcijxqp0mq247p29bz00vlql3dik5n";
      type = "gem";
    };
    version = "1.5.0";
  };
  sensu-extension = {
    dependencies = ["eventmachine"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0bpizp4n01rv72cryjjlrbfxxj3csish3mkxjzdy4inpi5j5h1dw";
      type = "gem";
    };
    version = "1.5.2";
  };
  sensu-extensions = {
    dependencies = ["sensu-extension" "sensu-extensions-check-dependencies" "sensu-extensions-debug" "sensu-extensions-json" "sensu-extensions-occurrences" "sensu-extensions-only-check-output" "sensu-extensions-ruby-hash" "sensu-json" "sensu-logger" "sensu-settings"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "04v221qjv8qy3jci40i66p63ig5vrrh0dpgmf1l8229x5m7bxrsg";
      type = "gem";
    };
    version = "1.10.0";
  };
  sensu-extensions-check-dependencies = {
    dependencies = ["sensu-extension"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1hc4kz7k983f6fk27ikg5drvxm4a85qf1k07hqssfyk3k75jyj1r";
      type = "gem";
    };
    version = "1.1.0";
  };
  sensu-extensions-debug = {
    dependencies = ["sensu-extension"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "11abdgn2kkkbvxq4692yg6a27qnxz4349gfiq7d35biy7vrw34lp";
      type = "gem";
    };
    version = "1.0.0";
  };
  sensu-extensions-json = {
    dependencies = ["sensu-extension"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1wnbn9sycdqdh9m0fhszaqkv0jijs3fkdbvcv8kdspx6irbv3m6g";
      type = "gem";
    };
    version = "1.0.0";
  };
  sensu-extensions-occurrences = {
    dependencies = ["sensu-extension"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0lx5wsbblfs0rvkxfg09bsz0g2mwmckrhga7idnarsnm8m565v1v";
      type = "gem";
    };
    version = "1.2.0";
  };
  sensu-extensions-only-check-output = {
    dependencies = ["sensu-extension"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0ds2i8wd4ji9ifig2zzr4jpxinvk5dm7j10pvaqy4snykxa3rqh3";
      type = "gem";
    };
    version = "1.0.0";
  };
  sensu-extensions-ruby-hash = {
    dependencies = ["sensu-extension"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1xyrj3gbmslbivcd5qcmyclgapn7qf7f5jwfvfpw53bxzib0h7s3";
      type = "gem";
    };
    version = "1.0.0";
  };
  sensu-json = {
    dependencies = ["oj"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "08zlxg5j3bhs72cc7wcllp026jbif0xiw6ib1cgawndlpsfl9fgx";
      type = "gem";
    };
    version = "2.1.1";
  };
  sensu-logger = {
    dependencies = ["eventmachine" "sensu-json"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0jpw4kz36ilaknrzb3rbkhpbgv93w2d668z2cv395dq30d4d3iwm";
      type = "gem";
    };
    version = "1.2.2";
  };
  sensu-plugin = {
    dependencies = ["json" "mixlib-cli"];
    source = {
      sha256 = "1k8mkkwb70z2j5lq457y7lsh5hr8gzd53sjbavpqpfgy6g4bxrg8";
      type = "gem";
    };
    version = "1.2.0";
  };
  sensu-plugins-disk-checks = {
    dependencies = ["sensu-plugin" "sys-filesystem"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1bjwkd7d31blqxwl1ydkkq7cn7ki4zv5da0n3i3lhdxgsgs4kbl2";
      type = "gem";
    };
    version = "3.1.0";
  };
  sensu-plugins-dns = {
    dependencies = ["dnsruby" "public_suffix" "sensu-plugin" "whois" "whois-parser"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1pqf9w8z4sfj43fr30hxdmnfa1lj2apkc0bm6jz851bmj9bzqahl";
      type = "gem";
    };
    version = "2.1.1";
  };
  sensu-plugins-elasticsearch = {
    dependencies = ["aws-es-transport" "aws-sdk" "elasticsearch" "rest-client" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "19p9mqc7z5nyh8nvlqlx03r28srd5w929pmiwdzwc9s1x8m00n95";
      type = "gem";
    };
    version = "2.1.0";
  };
  sensu-plugins-entropy-checks = {
    dependencies = ["sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "17s132bkzidw2lm7jj3qnsvna8p8ria19pbrmdsb8g8xfavf0xj0";
      type = "gem";
    };
    version = "1.0.0";
  };
  sensu-plugins-logs = {
    dependencies = ["sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "17shj4msc8bzqgqi5waw649hzzgl8q87z6flmpg0msnmv4r2h1cf";
      type = "gem";
    };
    version = "1.3.2";
  };
  sensu-plugins-mailer = {
    dependencies = ["aws-ses" "erubis" "mail" "mailgun-ruby" "ruby-ntlm" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "01zrns628gn0l04y2xilciy6vpi99wywsa4sdb8fgnm7hg81xay7";
      type = "gem";
    };
    version = "2.0.1";
  };
  sensu-plugins-memcached = {
    dependencies = ["dalli" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1wlqlv2gpgapd4lfbyxlk09qw9jypbcg8ankjfds7z1rx6p7cxq5";
      type = "gem";
    };
    version = "0.1.3";
  };
  sensu-plugins-mongodb = {
    dependencies = ["bson" "mongo" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0r4pgn06n3pyvas75igfy969z3hv1gbrwbf4cqvy88h9aqn5dw5a";
      type = "gem";
    };
    version = "1.4.1";
  };
  sensu-plugins-mysql = {
    dependencies = ["inifile" "ruby-mysql" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0d9an8r76qgaw4wsn9ka8pdpwkrz5ylvy41qmzzaj0mwkgxmrlhr";
      type = "gem";
    };
    version = "2.5.1";
  };
  sensu-plugins-network-checks = {
    dependencies = ["activesupport" "dnsbl-client" "net-ping" "sensu-plugin" "whois" "whois-parser"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0pyv7n3dj05442f5c3h2028dd93359a4aqv7xhgdj5jnyd9yqc07";
      type = "gem";
    };
    version = "3.2.1";
  };
  sensu-plugins-postgres = {
    dependencies = ["dentaku" "pg" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0xdvbd7h4crik59yrfmyjgigv5mlgjifp0qm1dfa3n6yacgcvg1v";
      type = "gem";
    };
    version = "1.4.6";
  };
  sensu-plugins-redis = {
    dependencies = ["redis" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "00v78jp08wfqlrwmrvmq6q297dj5qs7mzn1bzcn6dwz1c4ibbrm4";
      type = "gem";
    };
    version = "3.0.1";
  };
  sensu-plugins-ssl = {
    dependencies = ["sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0y5mly4wrhgnfp4cp54yjmyscy3gqnyvbyaw7ymjw50fg55d0syy";
      type = "gem";
    };
    version = "2.0.1";
  };
  sensu-plugins-supervisor = {
    dependencies = ["ox" "ruby-supervisor" "sensu-plugin"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1rc56nbv4r1z9fi4yanqb3w399qllgw6karw6ff5zmdqsr1wrhcf";
      type = "gem";
    };
    version = "1.1.0";
  };
  sensu-plugins-systemd = {
    dependencies = ["sensu-plugin" "systemd-bindings"];
    source = {
      fetchSubmodules = false;
      rev = "be972959c5f6cdc989b1122db72a4b10a1ecce77";
      sha256 = "123fnj9yiwbzxax9c14zy5iwc3qaldn5nqibs9k0nysr9zwkygpa";
      type = "git";
      url = "git://github.com/nyxcharon/sensu-plugins-systemd.git";
    };
    version = "0.0.1";
  };
  sensu-redis = {
    dependencies = ["eventmachine"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1npj732zw4hw8a2v85yj6pcbx16zyhnvcyaqx8n9sxmw0fikcfbg";
      type = "gem";
    };
    version = "2.3.0";
  };
  sensu-settings = {
    dependencies = ["parse-cron" "sensu-json"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "152n4hazv2l4vbzrgd316rpj135jmz042fyh6k2yv2kw0x29pi0f";
      type = "gem";
    };
    version = "10.14.0";
  };
  sensu-spawn = {
    dependencies = ["childprocess" "em-worker" "eventmachine" "ffi"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "17yc8ivjpjbvig9r7yl6991d6ma0kcq75fbpz6i856ljvcr3lmd5";
      type = "gem";
    };
    version = "2.5.0";
  };
  sensu-transport = {
    dependencies = ["amq-protocol" "amqp" "eventmachine" "sensu-redis"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1mj77r7xwfjd6xsmp3rivsxqhwhgbz3snd3pvc00vby41lvjp2g4";
      type = "gem";
    };
    version = "7.1.0";
  };
  sys-filesystem = {
    dependencies = ["ffi"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "10didky52nfapmybj6ipda18i8fcwf8bs9bbfbk5i7v1shzd36rf";
      type = "gem";
    };
    version = "1.1.7";
  };
  systemd-bindings = {
    dependencies = ["ruby-dbus"];
    source = {
      sha256 = "1bprj8njmzbshjmrabra3djhw6737hn9mm0n8sxb7wv1znpr7lds";
      type = "gem";
    };
    version = "0.0.1.1";
  };
  thread_safe = {
    source = {
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1fjx9j327xpkkdlxwmkl3a8wqj7i4l4jwlrv3z13mg95z9wl253z";
      type = "gem";
    };
    version = "1.2.5";
  };
  unf = {
    dependencies = ["unf_ext"];
    source = {
      sha256 = "0bh2cf73i2ffh4fcpdn9ir4mhq8zi50ik0zqa1braahzadx536a9";
      type = "gem";
    };
    version = "0.1.4";
  };
  unf_ext = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "06p1i6qhy34bpb8q8ms88y6f2kz86azwm098yvcc0nyqk9y729j1";
      type = "gem";
    };
    version = "0.0.7.5";
  };
  whois = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1nrcldii7g3ncgrihhm7hymbqqp45qkjylz4rcjxw6wkjgb7mq00";
      type = "gem";
    };
    version = "4.0.7";
  };
  whois-parser = {
    dependencies = ["activesupport" "whois"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "076b23j506qvy5vk60a0sy7krl12crfzjymffwc0b54wqc63i7fq";
      type = "gem";
    };
    version = "1.0.1";
  };
  xml-simple = {
    source = {
      sha256 = "0xlqplda3fix5pcykzsyzwgnbamb3qrqkgbrhhfz2a2fxhrkvhw8";
      type = "gem";
    };
    version = "1.1.5";
  };
}