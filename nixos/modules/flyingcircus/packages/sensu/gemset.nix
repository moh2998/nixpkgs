{
  "activesupport" = {
    version = "4.2.5";
    source = {
      type = "gem";
      sha256 = "1w2znchjbgzj3sgp0581q15rikcj1cji80ki2ky8fwdnjxlh54mb";
    };
    dependencies = [
      "i18n"
      "json"
      "minitest"
      "thread_safe"
      "tzinfo"
    ];
  };
  "amq-protocol" = {
    version = "2.0.1";
    source = {
      type = "gem";
      sha256 = "1rpn9vgh7y037aqhhp04smihzr73vp5i5g6xlqlha10wy3q0wp7x";
    };
  };
  "amqp" = {
    version = "1.6.0";
    source = {
      type = "gem";
      sha256 = "0kbrqnpjgj9v0722p3n5rw589l4g26ry8mcghwc5yr20ggkpdaz9";
    };
    dependencies = [
      "amq-protocol"
      "eventmachine"
    ];
  };
  "aws" = {
    version = "2.10.2";
    source = {
      type = "gem";
      sha256 = "0fmlilz3gxml4frf5q0hnvrw9xfr7zhwfmac3f5k63czdf5qdzrc";
    };
    dependencies = [
      "http_connection"
      "uuidtools"
      "xml-simple"
    ];
  };
  "aws-es-transport" = {
    version = "0.1.4";
    source = {
      type = "gem";
      sha256 = "1r2if0jcbw3xx019fs6lqkz65nffwgh7hjbh5fj13hi09g505m3m";
    };
    dependencies = [
      "aws-sdk"
      "elasticsearch"
      "faraday"
      "faraday_middleware"
    ];
  };
  "aws-sdk" = {
    version = "2.4.4";
    source = {
      type = "gem";
      sha256 = "0wxvkzn7nsp5r09z3428cmzzzpkjdqmcwgwsfmm3clb93k9ivchv";
    };
    dependencies = [
      "aws-sdk-resources"
    ];
  };
  "aws-sdk-core" = {
    version = "2.4.4";
    source = {
      type = "gem";
      sha256 = "0v624h6yv28vbmcskx6n67blzq2an0171wcppkr3sx335wi4hriw";
    };
    dependencies = [
      "jmespath"
    ];
  };
  "aws-sdk-resources" = {
    version = "2.4.4";
    source = {
      type = "gem";
      sha256 = "1a1lxkig0d2ihv8f581nq65z4b2cf89mg753mvkh8b1kh9ipybx4";
    };
    dependencies = [
      "aws-sdk-core"
    ];
  };
  "bson" = {
    version = "1.12.3";
    source = {
      type = "gem";
      sha256 = "0r8h83d4wh9yi1r80hz91as6nc2b0yl6xarmfxjrdrzl7mdgcyx6";
    };
  };
  "bson_ext" = {
    version = "1.12.3";
    source = {
      type = "gem";
      sha256 = "1wyfasc304spafd5mm9hv195vinh79yrbdq8yym4s7xry9rbifcy";
    };
    dependencies = [
      "bson"
    ];
  };
  "childprocess" = {
    version = "0.5.8";
    source = {
      type = "gem";
      sha256 = "1lv7axi1fhascm9njxh3lx1rbrnsm8wgvib0g7j26v4h1fcphqg0";
    };
    dependencies = [
      "ffi"
    ];
  };
  "concurrent-ruby" = {
    version = "1.1.5";
    source = {
      type = "gem";
      sha256 = "1x07r23s7836cpp5z9yrlbpljcxpax14yw4fy4bnp6crhr6x24an";
    };
  };
  "dentaku" = {
    version = "2.0.4";
    source = {
      type = "gem";
      sha256 = "18ga010bbhsgc876vf6z6swfnk2mgj30y96rcd4yafvmwnj5djgz";
    };
  };
  "dnsbl-client" = {
    version = "1.0.2";
    source = {
      type = "gem";
      sha256 = "1357r0y8xfnay05l9h26rrcqrjlnz0hy421g18pfrwm1psf3pp04";
    };
  };
  "dnsruby" = {
    version = "1.58.0";
    source = {
      type = "gem";
      sha256 = "0vf1940vxh3f387b1albb7r90zxrybaiw8094hf5z4zxc97ys7dj";
    };
  };
  "domain_name" = {
    version = "0.5.20180417";
    source = {
      type = "gem";
      sha256 = "0abdlwb64ns7ssmiqhdwgl27ly40x2l27l8hs8hn0z4kb3zd2x3v";
    };
    dependencies = [
      "unf"
    ];
  };
  "elasticsearch" = {
    version = "1.0.18";
    source = {
      type = "gem";
      sha256 = "1wdy17i56b4m7akp7yavnr8vhfhyz720waphmixq05dj21b11hl0";
    };
    dependencies = [
      "elasticsearch-api"
      "elasticsearch-transport"
    ];
  };
  "elasticsearch-api" = {
    version = "1.0.18";
    source = {
      type = "gem";
      sha256 = "1v6nb3ajz5rack3p4b4nz37hs0zb9x738h2ms8cc4plp6wqh1w5s";
    };
    dependencies = [
      "multi_json"
    ];
  };
  "elasticsearch-transport" = {
    version = "1.0.18";
    source = {
      type = "gem";
      sha256 = "0smfrz8nq49hgf67y5ayxa9i4rmmi0q4m51l0h499ykq4cvcwv6i";
    };
    dependencies = [
      "faraday"
      "multi_json"
    ];
  };
  "em-http-server" = {
    version = "0.1.8";
    source = {
      type = "gem";
      sha256 = "0y8l4gymy9dzjjchjav90ck6has2i2zdjihlhcyrg3jgq6kjzyq5";
    };
    dependencies = [
      "eventmachine"
    ];
  };
  "em-worker" = {
    version = "0.0.2";
    source = {
      type = "gem";
      sha256 = "0z4jx9z2q5hxvdvik4yp0ahwfk69qsmdnyp72ln22p3qlkq2z5wk";
    };
    dependencies = [
      "eventmachine"
    ];
  };
  "erubis" = {
    version = "2.7.0";
    source = {
      type = "gem";
      sha256 = "1fj827xqjs91yqsydf0zmfyw9p4l2jz5yikg3mppz6d7fi8kyrb3";
    };
  };
  "eventmachine" = {
    version = "1.2.2";
    source = {
      type = "gem";
      sha256 = "00mlcq33q104spkb5c997lwallpilhj0d6fzsbd4lr9s8lmjga5f";
    };
  };
  "faraday" = {
    version = "0.9.2";
    source = {
      type = "gem";
      sha256 = "1kplqkpn2s2yl3lxdf6h7sfldqvkbkpxwwxhyk7mdhjplb5faqh6";
    };
    dependencies = [
      "multipart-post"
    ];
  };
  "faraday_middleware" = {
    version = "0.10.1";
    source = {
      type = "gem";
      sha256 = "18jndnpls6aih57rlkzdq94m5r7zlkjngyirv01jqlxll8jy643r";
    };
    dependencies = [
      "faraday"
    ];
  };
  "ffi" = {
    version = "1.10.0";
    source = {
      type = "gem";
      sha256 = "0j8pzj8raxbir5w5k6s7a042sb5k02pg0f8s4na1r5lan901j00p";
    };
  };
  "http-cookie" = {
    version = "1.0.3";
    source = {
      type = "gem";
      sha256 = "004cgs4xg5n6byjs7qld0xhsjq3n6ydfh897myr2mibvh6fjc49g";
    };
    dependencies = [
      "domain_name"
    ];
  };
  "http_connection" = {
    version = "1.4.4";
    source = {
      type = "gem";
      sha256 = "0gj3imp4yyys5x2awym1nwy5qandmmpsjpf66m76d0gxfd4zznk9";
    };
  };
  "i18n" = {
    version = "0.9.5";
    source = {
      type = "gem";
      sha256 = "038qvz7kd3cfxk8bvagqhakx68pfbnmghpdkx7573wbf0maqp9a3";
    };
    dependencies = [
      "concurrent-ruby"
    ];
  };
  "inifile" = {
    version = "3.0.0";
    source = {
      type = "gem";
      sha256 = "1c5zmk7ia63yw5l2k14qhfdydxwi1sah1ppjdiicr4zcalvfn0xi";
    };
  };
  "jmespath" = {
    version = "1.4.0";
    source = {
      type = "gem";
      sha256 = "1d4wac0dcd1jf6kc57891glih9w57552zgqswgy74d1xhgnk0ngf";
    };
  };
  "json" = {
    version = "1.8.6";
    source = {
      type = "gem";
      sha256 = "0qmj7fypgb9vag723w1a49qihxrcf5shzars106ynw2zk352gbv5";
    };
  };
  "libxml-ruby" = {
    version = "3.1.0";
    source = {
      type = "gem";
      sha256 = "1r7m7zipkpam8ns4ys4qyh7yj3is3dy7ky6qwnw557pvpgx0aqrd";
    };
  };
  "libxml-xmlrpc" = {
    version = "0.1.5";
    source = {
      type = "gem";
      sha256 = "0xqp6j529aa2ygp8xrlz9a0pnh64x458jr4pywqanfw7i64a3qdb";
    };
    dependencies = [
      "libxml-ruby"
    ];
  };
  "mail" = {
    version = "2.6.3";
    source = {
      type = "gem";
      sha256 = "1nbg60h3cpnys45h7zydxwrl200p7ksvmrbxnwwbpaaf9vnf3znp";
    };
    dependencies = [
      "mime-types"
    ];
  };
  "mailgun-ruby" = {
    version = "1.0.3";
    source = {
      type = "gem";
      sha256 = "1aqa0ispfn27g20s8s517cykghycxps0bydqargx7687w6d320yb";
    };
    dependencies = [
      "json"
      "rest-client"
    ];
  };
  "memcached" = {
    version = "1.8.0";
    source = {
      type = "gem";
      sha256 = "0cbjisgc50s4scmp50zq7mrw4wdd9r69jhcbw3wwfr1zi2iv2xpj";
    };
  };
  "mime-types" = {
    version = "2.99.3";
    source = {
      type = "gem";
      sha256 = "03j98xr0qw2p2jkclpmk7pm29yvmmh0073d8d43ajmr0h3w7i5l9";
    };
  };
  "minitest" = {
    version = "5.11.3";
    source = {
      type = "gem";
      sha256 = "0icglrhghgwdlnzzp4jf76b0mbc71s80njn5afyfjn4wqji8mqbq";
    };
  };
  "mixlib-cli" = {
    version = "1.1.0";
    source = {
      type = "gem";
      sha256 = "1z2fzz1hf5z7qf154zjs4dw8wi275hd5z8i4y7islbm3s6x8ygxm";
    };
  };
  "mongo" = {
    version = "1.12.3";
    source = {
      type = "gem";
      sha256 = "0y0axsmd8x7f1417hd257r6bb4k4n3rgb5188bqcsyp082jgp85j";
    };
    dependencies = [
      "bson"
    ];
  };
  "multi_json" = {
    version = "1.13.1";
    source = {
      type = "gem";
      sha256 = "1rl0qy4inf1mp8mybfk56dfga0mvx97zwpmq5xmiwl5r770171nv";
    };
  };
  "multipart-post" = {
    version = "2.0.0";
    source = {
      type = "gem";
      sha256 = "09k0b3cybqilk1gwrwwain95rdypixb2q9w65gd44gfzsd84xi1x";
    };
  };
  "mysql" = {
    version = "2.9.1";
    source = {
      type = "gem";
      sha256 = "1y2b5rnspa0lllvqd6694hbkjhdn45389nrm3xfx6xxx6gf35p36";
    };
  };
  "mysql2" = {
    version = "0.3.18";
    source = {
      type = "gem";
      sha256 = "0dap507ba8pj3hpc3y8ammsq51xqflb54p5g262m1z55y6m7fm6k";
    };
  };
  "net-ping" = {
    version = "1.7.8";
    source = {
      type = "gem";
      sha256 = "19p3d39109xvbr4dcjs3g3zliazhc1k3iiw69mgb1w204hc7wkih";
    };
  };
  "netrc" = {
    version = "0.11.0";
    source = {
      type = "gem";
      sha256 = "0gzfmcywp1da8nzfqsql2zqi648mfnx6qwkig3cv36n9m0yy676y";
    };
  };
  "oj" = {
    version = "2.14.6";
    source = {
      type = "gem";
      sha256 = "0pa9vmbxivplphad4ddjy30ylbb3bi61y13vmwx4llz3svl8r8kk";
    };
  };
  "pg" = {
    version = "0.18.3";
    source = {
      type = "gem";
      sha256 = "00g33hdixgync6gp4mn0g0kjz5qygshi47xw58kdpd9n5lzdpg8c";
    };
  };
  "redis" = {
    version = "3.2.1";
    source = {
      type = "gem";
      sha256 = "16jzlqp80qiqg5cdc9l144n6k3c5qj9if4pgij87sscn8ahi993k";
    };
  };
  "rest-client" = {
    version = "1.8.0";
    source = {
      type = "gem";
      sha256 = "1m8z0c4yf6w47iqz6j2p7x1ip4qnnzvhdph9d5fgx081cvjly3p7";
    };
    dependencies = [
      "http-cookie"
      "mime-types"
      "netrc"
    ];
  };
  "ruby-dbus" = {
    version = "0.11.0";
    source = {
      type = "gem";
      sha256 = "1ga8q959i8j8iljnw9hgxnjlqz1q0f95p9r3hyx6r5fl657qbx8z";
    };
  };
  "ruby-supervisor" = {
    version = "0.0.2";
    source = {
      type = "gem";
      sha256 = "07g0030sb9psrnz3b8axyjrcgwrmd38p0m05nq24bvrlvav4vkc0";
    };
  };
  "sensu" = {
    version = "0.27.1";
    source = {
      type = "gem";
      sha256 = "1qy832q544lrisndrrdwpxfwvzwmlqmxap68yz7bkx16m2jlhwlz";
    };
    dependencies = [
      "em-http-server"
      "eventmachine"
      "sensu-extension"
      "sensu-extensions"
      "sensu-json"
      "sensu-logger"
      "sensu-redis"
      "sensu-settings"
      "sensu-spawn"
      "sensu-transport"
    ];
  };
  "sensu-extension" = {
    version = "1.5.1";
    source = {
      type = "gem";
      sha256 = "1lgmjxfbq11v4yi3qanf1qxv0sgm1a8a7wj7qyn1nkva6zmimss3";
    };
    dependencies = [
      "eventmachine"
    ];
  };
  "sensu-extensions" = {
    version = "1.7.1";
    source = {
      type = "gem";
      sha256 = "0axjqak7yhhznhs9f4q8km7ikha5khglwqsc33scck13hsvw9l6g";
    };
    dependencies = [
      "sensu-extension"
      "sensu-extensions-debug"
      "sensu-extensions-json"
      "sensu-extensions-occurrences"
      "sensu-extensions-only-check-output"
      "sensu-extensions-ruby-hash"
      "sensu-json"
      "sensu-logger"
      "sensu-settings"
    ];
  };
  "sensu-extensions-debug" = {
    version = "1.0.0";
    source = {
      type = "gem";
      sha256 = "11abdgn2kkkbvxq4692yg6a27qnxz4349gfiq7d35biy7vrw34lp";
    };
    dependencies = [
      "sensu-extension"
    ];
  };
  "sensu-extensions-json" = {
    version = "1.0.0";
    source = {
      type = "gem";
      sha256 = "1wnbn9sycdqdh9m0fhszaqkv0jijs3fkdbvcv8kdspx6irbv3m6g";
    };
    dependencies = [
      "sensu-extension"
    ];
  };
  "sensu-extensions-occurrences" = {
    version = "1.1.0";
    source = {
      type = "gem";
      sha256 = "0xi9888gp3lz5fik1k32bc1c6sjp7rr551p8dr5i3hsm5ii7blja";
    };
    dependencies = [
      "sensu-extension"
    ];
  };
  "sensu-extensions-only-check-output" = {
    version = "1.0.0";
    source = {
      type = "gem";
      sha256 = "0ds2i8wd4ji9ifig2zzr4jpxinvk5dm7j10pvaqy4snykxa3rqh3";
    };
    dependencies = [
      "sensu-extension"
    ];
  };
  "sensu-extensions-ruby-hash" = {
    version = "1.0.0";
    source = {
      type = "gem";
      sha256 = "1xyrj3gbmslbivcd5qcmyclgapn7qf7f5jwfvfpw53bxzib0h7s3";
    };
    dependencies = [
      "sensu-extension"
    ];
  };
  "sensu-json" = {
    version = "2.0.1";
    source = {
      type = "gem";
      sha256 = "08bn8a5fscbhc9mcjg5avwjjbwxn28b48336bdxx87yng0wyafm4";
    };
    dependencies = [
      "oj"
    ];
  };
  "sensu-logger" = {
    version = "1.2.1";
    source = {
      type = "gem";
      sha256 = "03kicjqz8a594bxnwyg6bcd4fipy2vxjl1gbaip4gpixxki32dx0";
    };
    dependencies = [
      "eventmachine"
      "sensu-json"
    ];
  };
  "sensu-plugin" = {
    version = "1.2.0";
    source = {
      type = "gem";
      sha256 = "1k8mkkwb70z2j5lq457y7lsh5hr8gzd53sjbavpqpfgy6g4bxrg8";
    };
    dependencies = [
      "json"
      "mixlib-cli"
    ];
  };
  "sensu-plugins-disk-checks" = {
    version = "1.1.3";
    source = {
      type = "gem";
      sha256 = "0d2qcn2ffirvnrnpw98kll412jy7plhg5x2kkpky79a8nx8bbnp5";
    };
    dependencies = [
      "sensu-plugin"
      "sys-filesystem"
    ];
  };
  "sensu-plugins-dns" = {
    version = "0.0.6";
    source = {
      type = "gem";
      sha256 = "0267cr8lxim2cypqn3dbjz8r5kzbzadbkssx790z1ssncjgl8qa9";
    };
    dependencies = [
      "dnsruby"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-elasticsearch" = {
    version = "1.12.0";
    source = {
      type = "gem";
      sha256 = "1cz7ky6c2bc1kc5w4i7ar95d3jfh5jaqddsnfqcj3mlm2i5jl7p6";
    };
    dependencies = [
      "aws-es-transport"
      "aws-sdk"
      "elasticsearch"
      "rest-client"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-entropy-checks" = {
    version = "0.0.3";
    source = {
      type = "gem";
      sha256 = "1sk9hkwzhx8vy0jy4gq9igadixbjzw3fvskskl29xcs92cqk1j32";
    };
    dependencies = [
      "sensu-plugin"
    ];
  };
  "sensu-plugins-logs" = {
    version = "1.3.1";
    source = {
      type = "gem";
      sha256 = "1sd9gqdvw1iy8vykilxfa0vwx45avk8inlqwsqhi8g3sm9j3yp4g";
    };
    dependencies = [
      "sensu-plugin"
    ];
  };
  "sensu-plugins-mailer" = {
    version = "0.1.2";
    source = {
      type = "gem";
      sha256 = "0ysqwssa5jfn1wgsn9pmqiy85swkmk87xki4i7q3w260rl138bf9";
    };
    dependencies = [
      "aws"
      "erubis"
      "mail"
      "mailgun-ruby"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-memcached" = {
    version = "0.0.3";
    source = {
      type = "gem";
      sha256 = "1n355hycsva61fvcc9vs1bi4qr23pbyl3gmpkxgic4hz4nm2lhny";
    };
    dependencies = [
      "memcached"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-mongodb" = {
    version = "0.0.8";
    source = {
      type = "gem";
      sha256 = "120ay9kclypqf3rx4xv2cgay0hi8hvql0xzlfpyamxvbgqdfn532";
    };
    dependencies = [
      "bson"
      "bson_ext"
      "mongo"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-mysql" = {
    version = "0.0.4";
    source = {
      type = "gem";
      sha256 = "0j4bqm4wi8i86cbpbmrp88q71bzcmsfaf4icb2ml4w2db0ccr2d9";
    };
    dependencies = [
      "aws"
      "inifile"
      "mysql"
      "mysql2"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-network-checks" = {
    version = "0.1.4";
    source = {
      type = "gem";
      sha256 = "1n474lg1fdjd9908dfwdhs1d18rj2g11fqf1sp761addg3rlh0wx";
    };
    dependencies = [
      "activesupport"
      "dnsbl-client"
      "net-ping"
      "sensu-plugin"
      "whois"
    ];
  };
  "sensu-plugins-postgres" = {
    version = "0.0.7";
    source = {
      type = "gem";
      sha256 = "1xh2gzpacmzrzxj7ibczdrzgf3hdja0yl5cskfqypiq007d48gr9";
    };
    dependencies = [
      "dentaku"
      "pg"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-redis" = {
    version = "0.1.0";
    source = {
      type = "gem";
      sha256 = "0v3gasiz3hgp6r4yzhalpqk2g4kcqqism01c3apyzcn0f6pvp3z7";
    };
    dependencies = [
      "redis"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-ssl" = {
    version = "0.0.6";
    source = {
      type = "gem";
      sha256 = "15md1czbvpw1d63x91k1x4rwhsgd88shmx0pv8083bywl2c87yqq";
    };
    dependencies = [
      "rest-client"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-supervisor" = {
    version = "0.0.3";
    source = {
      type = "gem";
      sha256 = "1idds9x01ccxldzi00xz5nx3jizdn3ywm1ijwmw2yb6zb171k0zi";
    };
    dependencies = [
      "libxml-xmlrpc"
      "ruby-supervisor"
      "sensu-plugin"
    ];
  };
  "sensu-plugins-systemd" = {
    version = "0.0.1";
    source = {
      type = "git";
      url = "git://github.com/nyxcharon/sensu-plugins-systemd.git";
      rev = "be972959c5f6cdc989b1122db72a4b10a1ecce77";
      sha256 = "0n1jbzs4ls4gmci8zc92nm3mi1n69w2i37k28zlfwxazbm1gyy0z";
      fetchSubmodules = false;
    };
    dependencies = [
      "sensu-plugin"
      "systemd-bindings"
    ];
  };
  "sensu-redis" = {
    version = "2.1.0";
    source = {
      type = "gem";
      sha256 = "10axrjg2q569bjdchpjsdillzszifkgkayaz390hnf876mssqwcg";
    };
    dependencies = [
      "eventmachine"
    ];
  };
  "sensu-settings" = {
    version = "9.8.0";
    source = {
      type = "gem";
      sha256 = "0nnjvmhim9lvxj3l1wxs3j1ns8vqmpgfdrxgv3hlxhkvdg56cmsk";
    };
    dependencies = [
      "sensu-json"
    ];
  };
  "sensu-spawn" = {
    version = "2.2.1";
    source = {
      type = "gem";
      sha256 = "1vz5kbqk3ld0s16zjl8m38l1m1xwcvjlfc1g4nfm45qxdyfn7la7";
    };
    dependencies = [
      "childprocess"
      "em-worker"
      "eventmachine"
    ];
  };
  "sensu-transport" = {
    version = "7.0.2";
    source = {
      type = "gem";
      sha256 = "15yib92hwyd8v04wcc0kaw0p8w2c2mwvi4ldya2jh3dqgs31mvhr";
    };
    dependencies = [
      "amq-protocol"
      "amqp"
      "eventmachine"
      "sensu-redis"
    ];
  };
  "sys-filesystem" = {
    version = "1.1.5";
    source = {
      type = "gem";
      sha256 = "08zi702aq7cgm3wmmai2f18ph30yvincnlk1crza8axrjvf7fr25";
    };
    dependencies = [
      "ffi"
    ];
  };
  "systemd-bindings" = {
    version = "0.0.1.1";
    source = {
      type = "gem";
      sha256 = "1bprj8njmzbshjmrabra3djhw6737hn9mm0n8sxb7wv1znpr7lds";
    };
    dependencies = [
      "ruby-dbus"
    ];
  };
  "thread_safe" = {
    version = "0.3.6";
    source = {
      type = "gem";
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
    };
  };
  "tzinfo" = {
    version = "1.2.5";
    source = {
      type = "gem";
      sha256 = "1fjx9j327xpkkdlxwmkl3a8wqj7i4l4jwlrv3z13mg95z9wl253z";
    };
    dependencies = [
      "thread_safe"
    ];
  };
  "unf" = {
    version = "0.1.4";
    source = {
      type = "gem";
      sha256 = "0bh2cf73i2ffh4fcpdn9ir4mhq8zi50ik0zqa1braahzadx536a9";
    };
    dependencies = [
      "unf_ext"
    ];
  };
  "unf_ext" = {
    version = "0.0.7.5";
    source = {
      type = "gem";
      sha256 = "06p1i6qhy34bpb8q8ms88y6f2kz86azwm098yvcc0nyqk9y729j1";
    };
  };
  "uuidtools" = {
    version = "2.1.5";
    source = {
      type = "gem";
      sha256 = "0zjvq1jrrnzj69ylmz1xcr30skf9ymmvjmdwbvscncd7zkr8av5g";
    };
  };
  "whois" = {
    version = "3.6.3";
    source = {
      type = "gem";
      sha256 = "1ckr4w1gba1m1yabl2piy7y9wy3hc0gzdxnqkr74ffk5xqbn0k49";
    };
    dependencies = [
      "activesupport"
    ];
  };
  "xml-simple" = {
    version = "1.1.5";
    source = {
      type = "gem";
      sha256 = "0xlqplda3fix5pcykzsyzwgnbamb3qrqkgbrhhfz2a2fxhrkvhw8";
    };
  };
}